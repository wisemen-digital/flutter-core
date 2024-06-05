import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wisecore/core/database/database_provider.dart';
import 'package:wisecore/core/app_name/app_name.dart';
import 'package:wisecore/core/onesignal/onesignal.dart';
import 'package:wisecore/core/router/app_router.dart';
import 'package:wisecore/core/sentry/sentry.dart';
import 'package:wisecore/core/services/app_router_service.dart';
import 'package:wisecore/core/services/shared_preferences.dart';
import 'package:isar/isar.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<ProviderContainer> initCore({
  required String flavorName,
  required String appName,
  required String? oneSignalKey,
  required String? sentryDsn,
  required Isar? database,
  required AppRouter router,
}) async {
  try {
    initOneSignal(apiKey: oneSignalKey);
  } catch (e) {
    debugPrint(e.toString());
  }

  if (!kDebugMode) {
    await initSentry(dsn: sentryDsn, env: flavorName.toLowerCase());
  }

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  debugPrint("✅ init core with $flavorName");

  return ProviderContainer(
    overrides: [
      appNameProvider.overrideWithValue(appName),
      sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      if (database != null) isarProvider.overrideWithValue(database),
      appRouterServiceProvider.overrideWith((ref) => router..ref = ref),
    ],
  );
}
