
import 'package:flutter/material.dart';
import 'package:stumato_march/widgets/text/src/helpers/cred_state.dart';

extension AnimationControllerExtensions on AnimationController {
  // stop the animation at its current value only if its already running
  void safeStop() => (isAnimating) ? stop() : null;

  // start the animation in forward direction only if it is not completed already or already running
  TickerFuture? safeForward({double? from}) => (!isAnimating && !isCompleted) ? forward(from: from) : null;

  TickerFuture? forwardIfResumed(CredState s) {
    TickerFuture? tickerFuture;
    if (s.lifecycleState == AppLifecycleState.resumed) {
      tickerFuture = safeForward();
    }
    return tickerFuture;
  }

  TickerFuture? reverseIfResumed(CredState s) {
    TickerFuture? tickerFuture;
    if (s.lifecycleState == AppLifecycleState.resumed) {
      tickerFuture = reverse();
    }
    return tickerFuture;
  }

  void repeatIfResumed(CredState s, {double? min, double? max, Duration? period}) {
    if (s.lifecycleState == AppLifecycleState.resumed) {
      repeat(min: min, max: max, period: period);
    }
  }

  void resetIfResumed(CredState s) {
    if (s.lifecycleState == AppLifecycleState.resumed) {
      reset();
    }
  }
}
