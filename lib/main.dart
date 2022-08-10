import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic_base/localization/localization.dart';
import 'package:flutter_basic_base/presentation/app/cubit/app_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/flavor_config.dart';
import 'injection/dependency_manager.dart';
import 'injection/injector.dart';
import 'presentation/app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  await FlavorConfig.config();
  await DependencyManager.inject();
  Localization.initApp(
    BlocProvider.value(
      value: injector<AppCubit>(),
      child: BlocBuilder(
        bloc: injector<AppCubit>(),
        builder: (context, state) {
          return const MyApp();
        },
      ),
    ),
  );
}
