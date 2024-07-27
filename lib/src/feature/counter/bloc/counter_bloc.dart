import 'dart:async';
import 'dart:math';

import 'package:counter_bloc/src/feature/counter/bloc/counter_state.dart';
import 'package:counter_bloc/src/feature/counter/model/counter.dart';

class CounterBloc {
  CounterBloc({required CounterState initialState}) : _state = initialState;

  CounterState _state;

  final _streamController = StreamController<CounterState>();

  CounterState get state => _state;

  Stream<CounterState> get stream =>
      _streamController.stream.asBroadcastStream();

  void _updateState(CounterState state) {
    if (_state == state) return;

    _state = state;
    _streamController.add(state);
  }

  void incrementCounter() {
    Counter counter = _state.counter;
    counter = counter.copyWith(count: counter.count + 1);
    _updateState(_state.copyWith(counter: counter));
  }

  void decrementCounter() {
    Counter counter = _state.counter;
    counter = counter.copyWith(count: max(counter.count - 1, 0));
    _updateState(_state.copyWith(counter: counter));
  }
}
