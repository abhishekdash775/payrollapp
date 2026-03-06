import 'dart:async';
import 'package:flutter/foundation.dart';

class CustomDebouncer {
  final int milliseconds;
  Timer? _timer;

  CustomDebouncer({required this.milliseconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(microseconds: milliseconds), action);
  }
}
