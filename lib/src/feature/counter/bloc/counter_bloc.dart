import 'dart:async';
import 'dart:math';

import 'package:counter_bloc/src/feature/counter/bloc/counter_event.dart';
import 'package:counter_bloc/src/feature/counter/bloc/counter_state.dart';

class CounterBloc {
  CounterBloc({required CounterState initialState}) : _state = initialState {
    _stateStream = _streamController.stream
        .asyncExpand<CounterState>(_mapEventToState)
        .asyncExpand<CounterState>(_updateState)
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
    yield CounterState.processing(counter: _state.counter);
    await Future.delayed(const Duration(milliseconds: 400));
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
    final count = _state.counter.count;
    return CounterState.idle(
      counter: _state.counter.copyWith(count: count + 1),
    );
  }

  CounterState _onCounterEvent$Decrement() {
    final count = _state.counter.count;
    return CounterState.idle(
      counter: _state.counter.copyWith(count: max(count - 1, 0)),
    );
  }
}
