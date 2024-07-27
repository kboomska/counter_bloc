import 'package:counter_bloc/src/feature/counter/model/counter.dart';

class CounterState {
  const CounterState({
    required this.counter,
  });

  factory CounterState.initial() =>
      const CounterState(counter: Counter(count: 0));

  final Counter counter;

  CounterState copyWith({
    Counter? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  String toString() => '$CounterState(counter: $counter)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CounterState && other.counter == counter;
  }

  @override
  int get hashCode => counter.hashCode;
}
