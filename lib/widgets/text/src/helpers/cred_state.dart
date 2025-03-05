// ignore_for_file: no-empty-block

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class CredState<T extends StatefulWidget> extends State<T> {
  Animation<double>? _routeAnimation;
  //  final LifecycleEventHandler _lifecycle = LifecycleEventHandler();
  bool _hasMissedUpdate = false;
  List<VoidCallback> setStateCallbacks = [];
  // WidgetsBindingObserver observer() => _lifecycle
  //   ..onPaused = () async {
  //     onPaused();
  //   }
  //   ..onResume = () async {
  //     onResume();
  //   }
  //   ..onInactive = () async {
  //     onInactive();
  //   }
  //   ..onDetached = () async {
  //     onDetached();
  //   }
  //   ..onHidden = () async {
  //     onHidden();
  //   };

  @mustCallSuper
  void onResume() {
    if (_hasMissedUpdate) {
      for (final callback in setStateCallbacks) {
        setState(callback);
      }
      setStateCallbacks.clear();
      _hasMissedUpdate = false;
    }
  }

  @mustCallSuper
  void onInactive() {}
  @mustCallSuper
  void onPaused() {}
  @mustCallSuper
  void onDetached() {}
  @mustCallSuper
  void onHidden() {}

  bool safeSetState(VoidCallback fn) {
    if (!isResumed()) {
      _hasMissedUpdate = true;
      setStateCallbacks.add(fn);
      return false;
    }
    if (mounted) {
      setState(fn);
      return true;
    }
    return false;
  }

  bool setStateIfMounted(VoidCallback fn) {
    if (!mounted) return false;
    setState(fn);
    return true;
  }

  bool isResumed() => lifecycleState == AppLifecycleState.resumed;
  bool isPaused() => lifecycleState == AppLifecycleState.paused;
  bool isInactive() => lifecycleState == AppLifecycleState.inactive;
  bool isDetached() => lifecycleState == AppLifecycleState.detached;
  bool isHidden() => lifecycleState == AppLifecycleState.hidden;

  AppLifecycleState? get lifecycleState => WidgetsBinding.instance.lifecycleState;

  void postFrameCallback(VoidCallback callback) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => callback());
  }

  bool addSafePostFrameCallback(VoidCallback callback) {
    bool isExecuted = false;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (!mounted) return;
        isExecuted = true;
        callback();
      },
    );
    return isExecuted;
  }

  // void removeLifecycleObserver() => WidgetsBinding.instance.removeObserver(_lifecycle);

  void _statusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      onRouteAnimComplete();
      _routeAnimation?.removeStatusListener(_statusListener);
    }
  }

  void onRouteAnimComplete() {}

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addObserver(observer());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _routeAnimation = mounted ? ModalRoute.of(context)?.animation : null;
      if (_routeAnimation != null) {
        if (_routeAnimation?.isCompleted ?? false) {
          onRouteAnimComplete();
        } else {
          _routeAnimation?.addStatusListener(_statusListener);
        }
      } else {
        onRouteAnimComplete();
      }
    });
  }

  // @mustCallSuper
  // @override
  // // void dispose() {
  // //   removeLifecycleObserver();
  // //   super.dispose();
  // // }
}
