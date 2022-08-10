import 'package:dio/dio.dart';
import 'package:flutter_basic_base/config/app_config.dart';
import 'package:flutter_basic_base/data/network/app_api.dart';
import 'package:flutter_basic_base/data/network/dio_helper.dart';
import 'package:flutter_basic_base/data/storage/shared_pref_manager.dart';
import 'package:flutter_basic_base/presentation/app/cubit/app_cubit.dart';
import 'package:flutter_basic_base/presentation/resources/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'injector.dart';

class DataModules {
  static Future<void> inject() async {
    injector.registerLazySingleton<Dio>(
      () => Dio(),
    );
    DioHelper.configApiDio(dio: injector.get<Dio>());

    /// Local storage
    injector.registerSingletonAsync<SharedPreferences>(() async {
      return SharedPreferences.getInstance();
    });
    injector.registerLazySingleton<SharedPreferencesManager>(
        () => SharedPreferencesManager(injector.get<SharedPreferences>()));

    /// Theme
    injector.registerLazySingleton<AppTheme>(() => AppTheme());

    /// Network client
    injector.registerLazySingleton<AppApi>(
      () => AppApi(
        injector.get<Dio>(),
        baseUrl: AppConfig.getInstance.apiBaseUrl,
      ),
    );

    /// Cubit
    injector.registerLazySingleton<AppCubit>(() => AppCubit());
  }
}
