import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';

class AppLogger {
  AppLogger._();

  // 🔴 ERROR
  static void error(Object error, {StackTrace? stackTrace, String? tag}) {
    if (kDebugMode) {
      log(
        "❌ ${error.toString()}",
        name: tag ?? "AppError",
        stackTrace: stackTrace,
      );
    }
  }

  static void json(Object jsonData, {String? tag}) {
    if (!kDebugMode) return;

    const encoder = JsonEncoder.withIndent('  ');
    final prettyJson = encoder.convert(jsonData);

    const chunkSize = 800; // safe log size

    print("📦 [${tag ?? "JSON"}]");

    for (int i = 0; i < prettyJson.length; i += chunkSize) {
      print(
        prettyJson.substring(
          i,
          i + chunkSize > prettyJson.length ? prettyJson.length : i + chunkSize,
        ),
      );
    }
  }

  // 🔵 INFO
  static void info(String message, {String? tag}) {
    if (kDebugMode) {
      log("ℹ️ $message", name: tag ?? "AppInfo");
    }
  }

  // 🟡 WARNING (optional but good)
  static void warning(String message, {String? tag}) {
    if (kDebugMode) {
      log("⚠️ $message", name: tag ?? "AppWarning");
    }
  }

  // 🟢 SUCCESS (optional)
  static void success(String message, {String? tag}) {
    if (kDebugMode) {
      log("✅ $message", name: tag ?? "AppSuccess");
    }
  }
}
