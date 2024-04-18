import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension TimeOfDayExtension on TimeOfDay {
  // Ported from org.threeten.bp;
  TimeOfDay plusMinutes(int minutes) {
    if (minutes == 0) {
      return this;
    } else {
      int mofd = hour * 60 + minute;
      int newMofd = ((minutes % 1440) + mofd + 1440) % 1440;
      if (mofd == newMofd) {
        return this;
      } else {
        int newHour = newMofd ~/ 60;
        int newMinute = newMofd % 60;
        return TimeOfDay(hour: newHour, minute: newMinute);
      }
    }
  }

  bool laterOrEqualThan(TimeOfDay other) {
    if (hour < other.hour) return false;
    if (hour > other.hour) return true;
    if (minute < other.minute) return false;
    if (minute > other.minute) return true;
    return true;
  }

  double get asDouble => hour + minute / 60.0;

  String customFormat({
    bool is24h = true,
    required BuildContext context,
  }) {
    final localizations = MaterialLocalizations.of(context);
    return localizations.formatTimeOfDay(
      this,
    );
  }

  String get format24Hour {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, hour, minute);
    final format = DateFormat('HH:mm');
    return format.format(dt);
  }

  int toMinutes() {
    return (hour * 60) + minute;
  }
}

extension StringToTimeOfDay on String? {
  TimeOfDay toTimeOfDay() {
    if (((this?.length) ?? 0) >= 5) {
      return TimeOfDay(hour: int.parse(this?.substring(0, 2) ?? '0'), minute: int.parse(this?.substring(3, 5) ?? '0'));
    }
    return const TimeOfDay(hour: 0, minute: 0);
  }
}
