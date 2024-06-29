import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  Debouncer({required this.interval});
  final Duration interval;

  VoidCallback? _action;
  Timer? _timer;

  void run(VoidCallback action) {
    _action = action;
    _timer?.cancel();
    _timer = Timer(interval, _executeAction);
  }

  void _executeAction() {
    _action?.call();
    _timer = null;
  }

  void cancel() {
    _action = null;
    _timer?.cancel();
    _timer = null;
  }
}
