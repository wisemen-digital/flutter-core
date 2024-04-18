// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appName": MessageLookupByLibrary.simpleMessage("Flutter Core"),
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "close": MessageLookupByLibrary.simpleMessage("Close"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "errorDefault":
            MessageLookupByLibrary.simpleMessage("Something went wrong"),
        "goOn": MessageLookupByLibrary.simpleMessage("Continue"),
        "internalServerError": MessageLookupByLibrary.simpleMessage(
            "Something is wrong with the server. Please try again later."),
        "internetCertificateConnectionError":
            MessageLookupByLibrary.simpleMessage(
                "You are connected to an insecure network."),
        "internetConnectionError": MessageLookupByLibrary.simpleMessage(
            "Check if you have a working network connection."),
        "loginError": MessageLookupByLibrary.simpleMessage(
            "Something went wrong with authenticating the app, please try again later."),
        "networkErrorNoAuthentication":
            MessageLookupByLibrary.simpleMessage("You are not authenticated."),
        "networkErrorNoInternetConnection":
            MessageLookupByLibrary.simpleMessage(
                "Check your internet connection."),
        "networkErrorSomethingWentWrong": MessageLookupByLibrary.simpleMessage(
            "Something went wrong, please try again later."),
        "no": MessageLookupByLibrary.simpleMessage("No"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "search": MessageLookupByLibrary.simpleMessage("Search"),
        "userCredentialsIncorrect": MessageLookupByLibrary.simpleMessage(
            "The user credentials were incorrect."),
        "yes": MessageLookupByLibrary.simpleMessage("Yes")
      };
}
