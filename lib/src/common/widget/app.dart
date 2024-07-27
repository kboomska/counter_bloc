import 'package:counter_bloc/src/feature/counter/logic/counter_controller.dart';
import 'package:counter_bloc/src/feature/counter/widget/counter_provider.dart';
import 'package:counter_bloc/src/feature/counter/widget/counter_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  App({super.key});

  final _controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Bloc Demo',
      debugShowCheckedModeBanner: false,
      home: CounterProvider(
        controller: _controller,
        child: const CounterScreen(),
      ),
    );
  }
}
