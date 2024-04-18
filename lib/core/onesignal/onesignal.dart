import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> initOneSignal({required String? apiKey}) async {
  //! OneSignal init
  if (apiKey != null && apiKey.isNotEmpty) {
    try {
      OneSignal.initialize(apiKey);
      debugPrint("✅ init OneSignal");
    } catch (e) {
      debugPrint("❌ OneSignal is NOT initialized: $e");
    }
  }
}
