extension DoubleExtensions on double {
  String get halfString {
    double rounded = (this * 2).roundToDouble() / 2;
    return rounded.toStringAsFixed(1);
  }

  double get halfValue {
    return (this * 2).roundToDouble() / 2;
  }
}
