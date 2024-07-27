import 'package:counter_bloc/src/feature/counter/widget/counter_provider.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _AgeDecrementWidget(),
                ),
              ),
              Expanded(
                child: _AgeTitle(),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _AgeIncrementWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgeTitle extends StatelessWidget {
  const _AgeTitle();

  @override
  Widget build(BuildContext context) {
    final count = CounterProvider.watch(context).counter.count;

    return Text(
      '$count',
      textAlign: TextAlign.center,
    );
  }
}

class _AgeIncrementWidget extends StatelessWidget {
  const _AgeIncrementWidget();

  @override
  Widget build(BuildContext context) {
    final controller = CounterProvider.read(context);

    return ElevatedButton(
      onPressed: controller.onIncrementButtonPressed,
      child: const Text('+'),
    );
  }
}

class _AgeDecrementWidget extends StatelessWidget {
  const _AgeDecrementWidget();

  @override
  Widget build(BuildContext context) {
    final controller = CounterProvider.read(context);

    return ElevatedButton(
      onPressed: controller.onDecrementButtonPressed,
      child: const Text('-'),
    );
  }
}
