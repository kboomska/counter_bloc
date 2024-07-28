import 'dart:async';
import 'dart:math';

import 'package:counter_bloc/src/feature/counter/bloc/counter_event.dart';
import 'package:counter_bloc/src/feature/counter/bloc/counter_state.dart';
import 'package:counter_bloc/src/feature/counter/model/counter.dart';

class CounterBloc {
  CounterBloc({required CounterState initialState}) : _state = initialState {
    _stateStream = _streamController.stream
        .asyncExpand<CounterState>(_mapEventToState)
        .asyncExpand(_updateState)
        .asBroadcastStream();
  }

  CounterState _state;

  final _streamController = StreamController<CounterEvent>();

  late final Stream<CounterState> _stateStream;

  CounterState get state => _state;

  Stream<CounterState> get stream => _stateStream;

  void add(CounterEvent event) {
    _streamController.add(event);
  }

  Stream<CounterState> _mapEventToState(CounterEvent event) async* {
    yield switch (event) {
      CounterEvent$Increment() => _onCounterEvent$Increment(),
      CounterEvent$Decrement() => _onCounterEvent$Decrement(),
    };
  }

  Stream<CounterState> _updateState(CounterState state) async* {
    if (_state == state) return;
    _state = state;
    yield state;
  }

  CounterState _onCounterEvent$Increment() {
    Counter counter = _state.counter;
    counter = counter.copyWith(count: counter.count + 1);
    return CounterState(counter: counter);
  }

  CounterState _onCounterEvent$Decrement() {
    Counter counter = _state.counter;
    counter = counter.copyWith(count: max(counter.count - 1, 0));
    return CounterState(counter: counter);
  }
}
