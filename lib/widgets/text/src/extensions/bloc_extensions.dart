// ignore_for_file: implicit_dynamic_type, strict_raw_type, prefer-match-file-name
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/streams.dart';

extension BlocReadExtension on BuildContext {
  T readBloc<T extends Bloc>() => BlocProvider.of<T>(this, listen: false);
}

extension BlocWatchExtension on BuildContext {
  T watchBloc<T extends Bloc>() => BlocProvider.of<T>(this, listen: true);
}

extension BlocX<Event, State> on Bloc<Event, State> {
  /// this stream will be seeded with init data as the current state of the bloc
  Stream<State> get stateStream {
    return stream.shareValueSeeded(state);
  }
}
