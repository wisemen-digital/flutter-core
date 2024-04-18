import 'package:flutter/material.dart';

extension DateExtensions on DateTime {
  bool isSameDate(DateTime? other) {
    if (other != null) {
      return year == other.year && month == other.month && day == other.day;
    } else {
      return false;
    }
  }

  DateTime get withoutTime {
    return DateTime(year, month, day);
  }

  TimeOfDay get onlyTime {
    return TimeOfDay(hour: hour, minute: minute);
  }

  String get schoolYear {
    String schoolYears = "";
    if (month < 9) {
      schoolYears = "${year - 1} - $year";
    } else {
      schoolYears = "$year - ${year + 1}";
    }
    return schoolYears;
  }
}
