import 'package:counter_bloc/src/feature/counter/model/counter.dart';

sealed class CounterState {
  const CounterState({
    required this.counter,
  });

  factory CounterState.initial() =>
      const CounterState$Idle(counter: Counter(count: 0));

  factory CounterState.idle({
    required Counter counter,
  }) = CounterState$Idle;

  factory CounterState.processing({
    required Counter counter,
  }) = CounterState$Processing;

  final Counter counter;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterState && other.counter == counter;
  }

  @override
  int get hashCode => counter.hashCode;
}

final class CounterState$Idle extends CounterState {
  const CounterState$Idle({required super.counter});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterState$Idle && other.counter == counter;
  }

  @override
  int get hashCode => counter.hashCode;
}

final class CounterState$Processing extends CounterState {
  const CounterState$Processing({required super.counter});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterState$Processing && other.counter == counter;
  }

  @override
  int get hashCode => counter.hashCode;
}
