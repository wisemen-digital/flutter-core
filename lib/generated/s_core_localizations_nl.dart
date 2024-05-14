import 's_core_localizations.dart';

/// The translations for Dutch Flemish (`nl`).
class SCoreTNl extends SCoreT {
  SCoreTNl([super.locale = 'nl']);

  @override
  String get appName => 'Flutter Core';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Terug';

  @override
  String get cancel => 'Annuleren';

  @override
  String get save => 'Oplsaan';

  @override
  String get goOn => 'Doorgaan';

  @override
  String get close => 'Sluiten';

  @override
  String get networkErrorSomethingWentWrong =>
      'Er is iets misgegaan, probeer het later opnieuw.';

  @override
  String get networkErrorNoInternetConnection =>
      'Controleer uw internetverbinding.';

  @override
  String get networkErrorNoAuthentication => 'U bent niet geauthenticeerd.';

  @override
  String get errorDefault => 'Er is iets misgegaan.';

  @override
  String get internetConnectionError =>
      'Controleer of u een werkende netwerkverbinding heeft.';

  @override
  String get internetCertificateConnectionError =>
      'U bent verbonden met een onveilig netwerk.';

  @override
  String get internalServerError =>
      'Er is iets mis met de server. Probeer het later opnieuw.';

  @override
  String get loginError =>
      'Er is iets misgegaan bij het authenticeren van de app, probeer het later opnieuw.';

  @override
  String get search => 'Zoeken';

  @override
  String get confirm => 'Bevestigen';

  @override
  String get delete => 'Verwijderen';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nee';

  @override
  String get userCredentialsIncorrect => 'De gebruikersgegevens waren onjuist.';
}
