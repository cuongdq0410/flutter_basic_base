enum AppFlavor {
  development,
  staging,
  production,
}

class AppConfig {
  final String apiBaseUrl;
  final AppFlavor appFlavor;

  AppConfig({
    required this.apiBaseUrl,
    required this.appFlavor,
  });

  static AppConfig? _instance;

  static AppConfig devConfig = AppConfig(
    apiBaseUrl: 'https://dev.api.zporter.co/',
    appFlavor: AppFlavor.development,
  );

  static AppConfig stagingConfig = AppConfig(
    apiBaseUrl: 'https://stg.api.zporter.co/',
    appFlavor: AppFlavor.staging,
  );

  static AppConfig productionConfig = AppConfig(
    apiBaseUrl: '',
    appFlavor: AppFlavor.production,
  );

  static AppConfig? setInstance({String? flavorName}) {
    if (_instance == null) {
      switch (flavorName) {
        case 'dev':
          _instance = devConfig;
          break;
        case 'stg':
          _instance = stagingConfig;
          break;
        case 'prod':
          _instance = productionConfig;
          break;
        default:
          _instance = devConfig;
          break;
      }
    }
    return _instance;
  }

  static AppConfig get getInstance => _instance ?? devConfig;
}
