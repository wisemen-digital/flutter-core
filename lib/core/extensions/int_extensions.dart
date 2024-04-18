import 'package:flutter/material.dart';

extension IntExtension on int {
  String get timeOfDayString {
    if (this >= 1440) {
      return '24:00';
    } else {
      Duration duration = Duration(minutes: this);
      return '${duration.inHours.remainder(24).toString().padLeft(2, '0')}:${duration.inMinutes.remainder(60).toString().padLeft(2, '0')}';
    }
  }

  TimeOfDay get timeOfDay {
    return TimeOfDay(hour: this ~/ 60, minute: this % 60);
  }
}
