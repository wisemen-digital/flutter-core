import 'package:flutter/material.dart';

extension ScrollExtensions on ScrollController {
  void scrollToBottom() {
    animateTo(position.maxScrollExtent,
        duration: Durations.medium2, curve: Curves.easeInOut);
  }

  void scrollToTop() {
    animateTo(position.minScrollExtent,
        duration: Durations.medium2, curve: Curves.easeInOut);
  }
}
