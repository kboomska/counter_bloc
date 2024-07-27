import 'package:flutter/material.dart';

class CounterProvider<T> extends InheritedWidget {
  final T bloc;

  const CounterProvider({
    super.key,
    required this.bloc,
    required super.child,
  });

  static T watch<T>(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<CounterProvider<T>>()
            ?.bloc ??
        (throw ArgumentError(
          'Out of scope, not found inherited widget '
              'a $CounterProvider of the exact type',
          'out_of_scope',
        ));
  }

  static T read<T>(BuildContext context) {
    return context.getInheritedWidgetOfExactType<CounterProvider<T>>()?.bloc ??
        (throw ArgumentError(
          'Out of scope, not found inherited widget '
              'a $CounterProvider of the exact type',
          'out_of_scope',
        ));
  }

  @override
  bool updateShouldNotify(CounterProvider<T> oldWidget) => false;
}
