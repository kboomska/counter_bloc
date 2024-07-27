import 'package:counter_bloc/src/feature/counter/bloc/counter_bloc.dart';
import 'package:counter_bloc/src/feature/counter/bloc/counter_state.dart';
import 'package:counter_bloc/src/feature/counter/widget/counter_provider.dart';
import 'package:counter_bloc/src/feature/counter/widget/counter_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Bloc Demo',
      debugShowCheckedModeBanner: false,
      home: CounterProvider<CounterBloc>(
        bloc: CounterBloc(
          initialState: CounterState.initial(),
        ),
        child: const CounterScreen(),
      ),
    );
  }
}
