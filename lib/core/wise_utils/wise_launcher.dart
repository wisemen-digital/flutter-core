import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'package:wisecore/core/wise_utils/wise_utils.dart';

class WiseLauncher {
  static Future<void> launchUrl(
      {required String url,
      bool isPlatformDefault = true,
      required BuildContext context,
      required String title,
      required String errorMessage}) async {
    Uri? uri = Uri.tryParse(url);
    if (uri != null) {
      await url_launcher.canLaunchUrl(uri).then((canLaunch) {
        if (canLaunch) {
          url_launcher.launchUrl(uri,
              mode: isPlatformDefault
                  ? url_launcher.LaunchMode.platformDefault
                  : url_launcher.LaunchMode.externalApplication);
        } else {
          showLaunchErrorDialog(
            context: context,
            title: title,
            url: url,
            errorMessage: errorMessage,
          );
        }
      });
    } else {
      showLaunchErrorDialog(
        context: context,
        title: title,
        url: url,
        errorMessage: errorMessage,
      );
    }
  }

  static Future<void> showLaunchErrorDialog({
    required BuildContext context,
    required String title,
    required String url,
    required String errorMessage,
  }) async {
    if (Platform.isIOS) {
      await showAlertDialog(
        title: title,
        message: errorMessage,
        context: context,
      );
    } else {
      showSnackBar(
        message: errorMessage,
        context: context,
      );
    }
  }

  static Future<void> launchEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    final Uri emailLaunchUri = Uri(
      queryParameters: {
        'subject': subject,
        'body': body,
      },
      scheme: 'mailto',
      path: email,
    );
    url_launcher.launchUrl(emailLaunchUri);
  }

  static Future<void> launchPhone({required String phoneNr}) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNr,
    );
    url_launcher.launchUrl(phoneLaunchUri);
  }

  static Future<bool> launchMapWithCoordinates(
      {required double latitude,
      required double longitude,
      required String name}) async {
    return await url_launcher.launchUrl(
      _createCoordinatesUri(
        latitude,
        longitude,
        name,
      ),
    );
  }

  static Future<void> launchMap({required String name}) async {
    await url_launcher.launchUrl(_createQueryUri(name));
  }

  /// Returns a [Uri] that can be launched on the current platform
  /// to open a maps application showing the result of a search query.
  static Uri _createQueryUri(String query) {
    Uri uri;

    if (kIsWeb) {
      uri = Uri.https(
          'www.google.com', '/maps/search/', {'api': '1', 'query': query});
    } else if (Platform.isAndroid) {
      uri = Uri(scheme: 'geo', host: '0,0', queryParameters: {'q': query});
    } else if (Platform.isIOS) {
      uri = Uri.https('maps.apple.com', '/', {'q': query});
    } else {
      uri = Uri.https(
          'www.google.com', '/maps/search/', {'api': '1', 'query': query});
    }

    return uri;
  }

  /// Returns a [Uri] that can be launched on the current platform
  /// to open a maps application showing coordinates ([latitude] and [longitude]).
  static Uri _createCoordinatesUri(double latitude, double longitude,
      [String? label]) {
    Uri uri;

    if (kIsWeb) {
      uri = Uri.https('www.google.com', '/maps/search/',
          {'api': '1', 'query': '$latitude,$longitude'});
    } else if (Platform.isAndroid) {
      var query = '$latitude,$longitude';

      if (label != null) query += '($label)';

      uri = Uri(scheme: 'geo', host: '0,0', queryParameters: {'q': query});
    } else if (Platform.isIOS) {
      var params = {
        'll': '$latitude,$longitude',
        'q': label ?? '$latitude, $longitude',
      };

      uri = Uri.https('maps.apple.com', '/', params);
    } else {
      uri = Uri.https('www.google.com', '/maps/search/',
          {'api': '1', 'query': '$latitude,$longitude'});
    }

    return uri;
  }
}
