import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wisecore/s_core_localizations/s_core_localizations.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

Future<void> launchUrl(
    {required String url,
    bool isPlatformDefault = true,
    required BuildContext context,
    required String title}) async {
  Uri? uri = Uri.tryParse(url);
  if (uri != null) {
    await url_launcher.canLaunchUrl(uri).then((canLaunch) {
      if (canLaunch) {
        url_launcher.launchUrl(uri,
            mode: isPlatformDefault
                ? url_launcher.LaunchMode.platformDefault
                : url_launcher.LaunchMode.externalApplication);
      } else {
        showLaunchErrorDialog(context: context, title: title, url: url);
      }
    });
  } else {
    showLaunchErrorDialog(context: context, title: title, url: url);
  }
}

Future<void> showLaunchErrorDialog(
    {required BuildContext context,
    required String title,
    required String url}) async {
  if (kDebugMode) {
    debugPrint("Could not launch: $url");
  }

  if (Platform.isIOS) {
    await showAlertDialog(
        title: title,
        message: SCore.of(context).networkErrorSomethingWentWrong,
        context: context);
  } else {
    showSnackBar(
        message: SCore.of(context).networkErrorSomethingWentWrong,
        context: context);
  }
}

Future<void> launchEmail({
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

Future<void> launchPhone({required String phoneNr}) async {
  final Uri phoneLaunchUri = Uri(
    scheme: 'tel',
    path: phoneNr,
  );
  url_launcher.launchUrl(phoneLaunchUri);
}

Future<bool> launchMapWithCoordinates(
    {required String latitude,
    required String longitude,
    required String name}) async {
  return await MapsLauncher.launchCoordinates(
      double.parse(latitude), double.parse(longitude), name);
}

Future<void> launchMap({required String name}) async {
  MapsLauncher.launchQuery(name);
}

bool get isWeb => kIsWeb;

bool get isIos => !kIsWeb && Platform.isIOS;

bool get isAndroid => !kIsWeb && Platform.isAndroid;

bool isDemotime = true;

//class for copying with null values
class Optional<T> {
  final T value;
  const Optional.value(this.value);
}

String prettyJson(dynamic json) {
  var spaces = ' ' * 4;
  var encoder = JsonEncoder.withIndent(spaces);
  return encoder.convert(json);
}

/// Custom page scroll physics
// ignore: must_be_immutable
class CustomLockScrollPhysics extends ScrollPhysics {
  /// Lock swipe on drag-drop gesture
  /// If it is a user gesture, [applyPhysicsToUserOffset] is called before [applyBoundaryConditions];
  /// If it is a programming gesture eg. `controller.animateTo(index)`, [applyPhysicsToUserOffset] is not called.
  bool _lock = false;

  /// Lock scroll to the left
  final bool lockLeft;

  /// Lock scroll to the right
  final bool lockRight;

  /// Creates physics for a [PageView].
  /// [lockLeft] Lock scroll to the left
  /// [lockRight] Lock scroll to the right
  CustomLockScrollPhysics(
      {super.parent, this.lockLeft = false, this.lockRight = false});

  @override
  CustomLockScrollPhysics applyTo(ancestor) {
    return CustomLockScrollPhysics(
        parent: buildParent(ancestor),
        lockLeft: lockLeft,
        lockRight: lockRight);
  }

  @override
  double applyPhysicsToUserOffset(ScrollMetrics position, double offset) {
    if ((lockRight && offset < 0) || (lockLeft && offset > 0)) {
      _lock = true;
      return 0.0;
    }

    return offset;
  }

  @override
  double applyBoundaryConditions(ScrollMetrics position, double value) {
    assert(() {
      if (value == position.pixels) {
        throw FlutterError(
            '$runtimeType.applyBoundaryConditions() was called redundantly.\n'
            'The proposed new position, $value, is exactly equal to the current position of the '
            'given ${position.runtimeType}, ${position.pixels}.\n'
            'The applyBoundaryConditions method should only be called when the value is '
            'going to actually change the pixels, otherwise it is redundant.\n'
            'The physics object in question was:\n'
            '  $this\n'
            'The position object in question was:\n'
            '  $position\n');
      }
      return true;
    }());

    /*
     * Handle the hard boundaries (min and max extents)
     * (identical to ClampingScrollPhysics)
     */
    // under-scroll
    if (value < position.pixels &&
        position.pixels <= position.minScrollExtent) {
      return value - position.pixels;
    }
    // over-scroll
    else if (position.maxScrollExtent <= position.pixels &&
        position.pixels < value) {
      return value - position.pixels;
    }
    // hit top edge
    else if (value < position.minScrollExtent &&
        position.minScrollExtent < position.pixels) {
      return value - position.pixels;
    }
    // hit bottom edge
    else if (position.pixels < position.maxScrollExtent &&
        position.maxScrollExtent < value) {
      return value - position.pixels;
    }

    var isGoingLeft = value <= position.pixels;
    var isGoingRight = value >= position.pixels;
    if (_lock && ((lockLeft && isGoingLeft) || (lockRight && isGoingRight))) {
      _lock = false;
      return value - position.pixels;
    }

    return 0.0;
  }
}

class Debouncer {
  final Duration duration;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({this.duration = Durations.long1});

  void run(VoidCallback action) {
    if (null != _timer) {
      _timer!.cancel();
    }
    _timer = Timer(duration, action);
  }
}

Timer makePeriodicTimer(
  Duration duration,
  void Function(Timer timer) callback, {
  bool fireNow = false,
}) {
  var timer = Timer.periodic(duration, callback);
  if (fireNow) {
    callback(timer);
  }
  return timer;
}

void showSnackBar({required BuildContext context, required String? message}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(
    SnackBar(
      content: Text(message ?? ""),
    ),
  );
}

Future<void> showAlertDialog(
    {required String? title,
    required String? message,
    Function()? onPressed,
    required BuildContext context}) async {
  await showDialog(
    context: context,
    builder: (_) => CupertinoAlertDialog(
      title: Text(title ?? ""),
      content: Text(message ?? ""),
      actions: [
        CupertinoButton(
          onPressed: onPressed ??
              () {
                Navigator.of(context).pop();
              },
          child: Text(
            SCore.of(context).ok,
          ),
        ),
      ],
    ),
  );
}
