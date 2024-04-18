extension StringExtensions on String {
  String get correctEllipsis {
    return replaceAll('', '\u200B');
  }

  String get capitalized {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get enableSlashN {
    return replaceAll(r'\n', '\n');
  }
}
