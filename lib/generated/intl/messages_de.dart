// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a de locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'de';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Flutter Core"),
        "back": MessageLookupByLibrary.simpleMessage("Zurück"),
        "cancel": MessageLookupByLibrary.simpleMessage("Abbrechen"),
        "close": MessageLookupByLibrary.simpleMessage("Schließen"),
        "confirm": MessageLookupByLibrary.simpleMessage("Bestätigen"),
        "delete": MessageLookupByLibrary.simpleMessage("Löschen"),
        "errorDefault":
            MessageLookupByLibrary.simpleMessage("Etwas ist schiefgelaufen."),
        "goOn": MessageLookupByLibrary.simpleMessage("Weiter"),
        "internalServerError": MessageLookupByLibrary.simpleMessage(
            "Mit dem Server stimmt etwas nicht. Bitte versuchen Sie es später erneut."),
        "internetCertificateConnectionError":
            MessageLookupByLibrary.simpleMessage(
                "Sie sind mit einem unsicheren Netzwerk verbunden."),
        "internetConnectionError": MessageLookupByLibrary.simpleMessage(
            "Überprüfen Sie, ob Sie eine funktionierende Netzwerkverbindung haben."),
        "loginError": MessageLookupByLibrary.simpleMessage(
            "Etwas ist bei der Authentifizierung der App schiefgelaufen, bitte versuchen Sie es später erneut."),
        "networkErrorNoAuthentication": MessageLookupByLibrary.simpleMessage(
            "Sie sind nicht authentifiziert."),
        "networkErrorNoInternetConnection":
            MessageLookupByLibrary.simpleMessage(
                "Überprüfen Sie Ihre Internetverbindung."),
        "networkErrorSomethingWentWrong": MessageLookupByLibrary.simpleMessage(
            "Etwas ist schiefgelaufen, bitte versuchen Sie es später erneut."),
        "no": MessageLookupByLibrary.simpleMessage("Nein"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "save": MessageLookupByLibrary.simpleMessage("Speichern"),
        "search": MessageLookupByLibrary.simpleMessage("Suchen"),
        "userCredentialsIncorrect": MessageLookupByLibrary.simpleMessage(
            "Die Benutzerdaten waren falsch."),
        "yes": MessageLookupByLibrary.simpleMessage("Ja")
      };
}
