import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> initSentry({required String? dsn, required String? env}) async {
  if (dsn != null && env != null) {
    await SentryFlutter.init(
      (options) {
        options.dsn = dsn;
        options.environment = env;
      },
    );

    debugPrint("✅ init Sentry");
  }
}
