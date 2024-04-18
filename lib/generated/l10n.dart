// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flutter Core`
  String get appName {
    return Intl.message(
      'Flutter Core',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get goOn {
    return Intl.message(
      'Continue',
      name: 'goOn',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again later.`
  String get networkErrorSomethingWentWrong {
    return Intl.message(
      'Something went wrong, please try again later.',
      name: 'networkErrorSomethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `Check your internet connection.`
  String get networkErrorNoInternetConnection {
    return Intl.message(
      'Check your internet connection.',
      name: 'networkErrorNoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `You are not authenticated.`
  String get networkErrorNoAuthentication {
    return Intl.message(
      'You are not authenticated.',
      name: 'networkErrorNoAuthentication',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get errorDefault {
    return Intl.message(
      'Something went wrong',
      name: 'errorDefault',
      desc: '',
      args: [],
    );
  }

  /// `Check if you have a working network connection.`
  String get internetConnectionError {
    return Intl.message(
      'Check if you have a working network connection.',
      name: 'internetConnectionError',
      desc: '',
      args: [],
    );
  }

  /// `You are connected to an insecure network.`
  String get internetCertificateConnectionError {
    return Intl.message(
      'You are connected to an insecure network.',
      name: 'internetCertificateConnectionError',
      desc: '',
      args: [],
    );
  }

  /// `Something is wrong with the server. Please try again later.`
  String get internalServerError {
    return Intl.message(
      'Something is wrong with the server. Please try again later.',
      name: 'internalServerError',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong with authenticating the app, please try again later.`
  String get loginError {
    return Intl.message(
      'Something went wrong with authenticating the app, please try again later.',
      name: 'loginError',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `The user credentials were incorrect.`
  String get userCredentialsIncorrect {
    return Intl.message(
      'The user credentials were incorrect.',
      name: 'userCredentialsIncorrect',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'nl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
