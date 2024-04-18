import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:wisecore/generated/s_core_localizations.dart';

abstract class SCore extends SCoreT {
  SCore(super.locale);

  //! Don't forget to run this command in terminal: flutter gen-l10n

  static SCoreT of(BuildContext context) {
    final instance = maybeOf(context);
    assert(
      instance != null,
      "Did you add SCore.delegate in localizationsDelegates?\nLanguage not supported: '${PlatformDispatcher.instance.locale.languageCode}' is not suppored in Flutter Core please add it in the library.",
    );
    return instance!;
  }

  static SCoreT? maybeOf(BuildContext context) {
    return Localizations.of<SCoreT>(context, SCoreT);
  }

  static const LocalizationsDelegate<SCoreT> delegate = SCoreT.delegate;
}
