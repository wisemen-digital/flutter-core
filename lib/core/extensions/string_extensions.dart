extension NullableStringExtension on String? {
  String? get orNull {
    if (this == null || this!.trim().isEmpty) {
      return null;
    }
    return this;
  }
}
