// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wisecore/core/app_name/app_name.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

class ErrorDialogShower {
  ErrorDialogShower({
    required this.networkErrorString,
    required this.appName,
    this.ok = "OK",
    this.onConfirm,
  });
  String networkErrorString;
  String appName;
  String ok;
  Function? onConfirm;

  Future<void> showErrorDialog(
      BuildContext context, AsyncValue asyncValue) async {
    if (asyncValue.hasError && !asyncValue.isLoading) {
      String message = networkErrorString;

      if (asyncValue.error is Exception) {
        Exception exception = asyncValue.error as Exception;
        //* Remove "Exception:" text from string
        message = exception.toString().replaceAll("Exception: ", "");
      } else {
        message = kDebugMode ? asyncValue.error.toString() : networkErrorString;
      }
      Logger().e(asyncValue.error.toString(),
          error: asyncValue.error.toString(),
          stackTrace: asyncValue.stackTrace);

      await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return CupertinoAlertDialog(
              title: Text(appName),
              actions: [
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text(ok),
                  onPressed: () async {
                    if (onConfirm != null) {
                      await onConfirm!();
                    }
                    Navigator.of(_).pop();
                  },
                ),
              ],
              content: Text(message),
            );
          });
    }
  }
}

extension AsyncValueExtensions on AsyncValue {
  Future<void> showErrorDialog({
    required Ref ref,
    required BuildContext? context,
    required String baseErrorString,
    String confirmTitle = "OK",
    Function? onConfirm,
  }) async {
    if (hasError && !isLoading && context != null) {
      String message = baseErrorString;

      if (error is Exception) {
        Exception exception = error as Exception;
        //* Remove "Exception:" text from string
        message = exception.toString().replaceAll("Exception: ", "");
      } else {
        message = kDebugMode ? error.toString() : baseErrorString;
      }
      Logger()
          .e(error.toString(), error: error.toString(), stackTrace: stackTrace);

      await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return CupertinoAlertDialog(
            title: Text(ref.read(appNameProvider)), // Text((error.toString())),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text(confirmTitle),
                onPressed: () async {
                  if (onConfirm != null) {
                    await onConfirm();
                  }
                  Navigator.of(_).pop();
                },
              ),
            ],
            content: Text(message),
          );
        },
      );
    }
  }
}
