import 'package:flutter/material.dart';
import 'package:flutter_basic_base/presentation/navigation/app_navigator.dart';
import 'package:flutter_basic_base/presentation/widget/dialogs/alert_action.dart';
import 'package:flutter_basic_base/presentation/widget/dialogs/pending_action.dart';

enum DialogType { error, success, warning }

class DialogUtils {
  static Widget? commonLoadingWidget;

  static bool _isShowingDialog = false;

  static void hideLoading({BuildContext? context}) {
    if (!_isShowingDialog) return;

    final BuildContext? buildContext = context ?? AppNavigator.currentContext;
    if (buildContext != null) {
      Navigator.of(buildContext).pop();
    }

    _isShowingDialog = false;
  }

  static void showLoading(
      {BuildContext? context, Widget? customLoadingWidget}) {
    if (_isShowingDialog) return;

    final BuildContext? buildContext = context ?? AppNavigator.currentContext;
    if (buildContext == null) return;

    showDialog(
      barrierDismissible: false,
      context: buildContext,
      useSafeArea: false,
      useRootNavigator: context == null,
      builder: (BuildContext context) {
        return customLoadingWidget ??
            commonLoadingWidget ??
            const PendingAction();
      },
    );

    _isShowingDialog = true;
  }

  static showAlert(
    BuildContext? context, {
    DialogType dialogType = DialogType.error,
    required String message,
  }) {
    if (_isShowingDialog) return;

    final BuildContext? buildContext = context ?? AppNavigator.currentContext;
    if (buildContext == null) return;
    Widget icon = const SizedBox();
    switch (dialogType) {
      case DialogType.error:
        icon = const Icon(Icons.error, color: Colors.red);
        break;
      case DialogType.warning:
        icon = const Icon(
          Icons.warning_amber_rounded,
          color: Colors.yellow,
        );
        break;
      case DialogType.success:
        icon = const Icon(
          Icons.done,
          color: Colors.green,
        );
        break;
      default:
        break;
    }
    showDialog(
      context: buildContext,
      useSafeArea: false,
      barrierDismissible: false,
      barrierColor: Colors.black54,
      builder: (_) {
        return AlertAction(
          message: message,
          icon: icon,
        );
      },
    );
    _isShowingDialog = true;
    Future.delayed(const Duration(seconds: 2)).then((value) {
      hideLoading(context: buildContext);
    });
  }
}
