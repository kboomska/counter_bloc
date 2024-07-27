import 'package:counter_bloc/src/feature/counter/logic/counter_controller.dart';
import 'package:flutter/material.dart';

class CounterProvider extends InheritedNotifier<CounterController> {
  final CounterController controller;

  const CounterProvider({
    super.key,
    required this.controller,
    required super.child,
  }) : super(notifier: controller);

  static CounterController watch(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<CounterProvider>()
            ?.controller ??
        (throw ArgumentError(
          'Out of scope, not found inherited widget '
              'a $CounterProvider of the exact type',
          'out_of_scope',
        ));
  }

  static CounterController read(BuildContext context) {
    return context
            .getInheritedWidgetOfExactType<CounterProvider>()
            ?.controller ??
        (throw ArgumentError(
          'Out of scope, not found inherited widget '
              'a $CounterProvider of the exact type',
          'out_of_scope',
        ));
  }
}
