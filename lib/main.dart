import 'dart:async';
import 'dart:developer';

import 'package:counter_bloc/src/common/widget/app.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () => runApp(const App()),
    (error, stack) {
      log('Zone error: $error', error: error, stackTrace: stack);
    },
  );
}
