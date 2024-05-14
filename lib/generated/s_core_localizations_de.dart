import 's_core_localizations.dart';

/// The translations for German (`de`).
class SCoreTDe extends SCoreT {
  SCoreTDe([super.locale = 'de']);

  @override
  String get appName => 'Flutter Core';

  @override
  String get ok => 'OK';

  @override
  String get back => 'Zurück';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';

  @override
  String get goOn => 'Weiter';

  @override
  String get close => 'Schließen';

  @override
  String get networkErrorSomethingWentWrong =>
      'Etwas ist schiefgelaufen, bitte versuchen Sie es später erneut.';

  @override
  String get networkErrorNoInternetConnection =>
      'Überprüfen Sie Ihre Internetverbindung.';

  @override
  String get networkErrorNoAuthentication => 'Sie sind nicht authentifiziert.';

  @override
  String get errorDefault => 'Etwas ist schiefgelaufen.';

  @override
  String get internetConnectionError =>
      'Überprüfen Sie, ob Sie eine funktionierende Netzwerkverbindung haben.';

  @override
  String get internetCertificateConnectionError =>
      'Sie sind mit einem unsicheren Netzwerk verbunden.';

  @override
  String get internalServerError =>
      'Mit dem Server stimmt etwas nicht. Bitte versuchen Sie es später erneut.';

  @override
  String get loginError =>
      'Etwas ist bei der Authentifizierung der App schiefgelaufen, bitte versuchen Sie es später erneut.';

  @override
  String get search => 'Suchen';

  @override
  String get confirm => 'Bestätigen';

  @override
  String get delete => 'Löschen';

  @override
  String get yes => 'Ja';

  @override
  String get no => 'Nein';

  @override
  String get userCredentialsIncorrect => 'Die Benutzerdaten waren falsch.';
}
