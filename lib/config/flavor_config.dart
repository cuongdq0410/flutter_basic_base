import 'dart:developer';

import 'package:flutter/services.dart';

import 'app_config.dart';

class FlavorConfig {
  static Future<void> config() async {
    await const MethodChannel('flavor').invokeMethod<String>('getFlavor').then(
      (String? flavor) async {
        final appConfig = AppConfig.setInstance(flavorName: flavor);
        log("App Config $flavor: ${appConfig!.apiBaseUrl}");
      },
    ).catchError(
      (error) {
        AppConfig.setInstance(flavorName: AppFlavor.development.name);
      },
    );
  }
}
