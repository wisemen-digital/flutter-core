import 's_core_localizations.dart';

/// The translations for English (`en`).
class SCoreTEn extends SCoreT {
  SCoreTEn([super.locale = 'en']);

  @override
  String get appName => 'Flutter Core';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Back';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get goOn => 'Continue';

  @override
  String get close => 'Close';

  @override
  String get networkErrorSomethingWentWrong =>
      'Something went wrong, please try again later.';

  @override
  String get networkErrorNoInternetConnection =>
      'Check your internet connection.';

  @override
  String get networkErrorNoAuthentication => 'You are not authenticated.';

  @override
  String get errorDefault => 'Something went wrong';

  @override
  String get internetConnectionError =>
      'Check if you have a working network connection.';

  @override
  String get internetCertificateConnectionError =>
      'You are connected to an insecure network.';

  @override
  String get internalServerError =>
      'Something is wrong with the server. Please try again later.';

  @override
  String get loginError =>
      'Something went wrong with authenticating the app, please try again later.';

  @override
  String get search => 'Search';

  @override
  String get confirm => 'Confirm';

  @override
  String get delete => 'Delete';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get userCredentialsIncorrect => 'The user credentials were incorrect.';
}
