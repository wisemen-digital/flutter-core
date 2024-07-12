import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

  Future<void> showErrorDialog(BuildContext context, AsyncValue asyncValue,
      {String? customErrorMessage}) async {
    if (asyncValue.hasError && !asyncValue.isLoading) {
      String message = networkErrorString;
      if (customErrorMessage != null) {
        message = customErrorMessage;
      } else if (asyncValue.error is DioException) {
        DioException exception = asyncValue.error as DioException;
        message = exception.message ?? networkErrorString;
      } else if (asyncValue.error is Exception) {
        Exception exception = asyncValue.error as Exception;
        //* Remove "Exception:" text from string
        message = exception.toString().replaceAll("Exception: ", "");
      } else {
        message = asyncValue.error?.toString() ?? networkErrorString;
      }

      await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
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

                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
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

extension AsyncValueExtensions on AsyncValue {
  Future<void> showErrorDialog({
    required ErrorDialogShower dialogShower,
    required BuildContext? context,
  }) async {
    await dialogShower.showErrorDialog(context!, this);
  }
}
