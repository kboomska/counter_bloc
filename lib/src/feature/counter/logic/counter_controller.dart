import 'dart:math';

import 'package:counter_bloc/src/feature/counter/model/counter.dart';
import 'package:flutter/foundation.dart';

class CounterController extends ChangeNotifier {
  Counter _counter = Counter(count: 0);

  Counter get counter => _counter;

  void onIncrementButtonPressed() {
    _counter = counter.copyWith(count: counter.count + 1);
    notifyListeners();
  }

  void onDecrementButtonPressed() {
    _counter = counter.copyWith(count: max(counter.count - 1, 0));
    notifyListeners();
  }
}
