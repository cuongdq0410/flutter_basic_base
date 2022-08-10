import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic_base/presentation/app/cubit/app_cubit.dart';
import 'package:flutter_basic_base/presentation/navigation/route_define.dart';
import 'package:flutter_basic_base/presentation/resources/app_theme.dart';
import 'package:flutter_basic_base/utils/keyboard_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../navigation/app_navigator.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return BlocBuilder(
      bloc: context.read<AppCubit>(),
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(375, 812),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
              title: "App base",
              debugShowCheckedModeBanner: false,
              theme: AppTheme.lightTheme,
              themeMode: AppTheme.currentTheme,
              darkTheme: AppTheme.darkTheme,
              navigatorKey: AppNavigator.navigatorKey,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              locale: context.locale,
              initialRoute: RouteDefine.loginScreen.name,
              onGenerateRoute: GenerateRoute.generateRoute,
              builder: (context, child) {
                return GestureDetector(
                  onTap: () {
                    KeyboardUtils.hideKeyboard(context);
                  },
                  child: MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                    child: child ?? const SizedBox(),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
