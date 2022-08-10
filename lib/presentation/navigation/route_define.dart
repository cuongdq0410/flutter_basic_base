import 'package:flutter/material.dart';
import 'package:flutter_basic_base/presentation/pages/feed/ui/feed_screen.dart';
import 'package:flutter_basic_base/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter_basic_base/presentation/pages/home/ui/home_screen.dart';
import 'package:flutter_basic_base/presentation/pages/login/cubit/login_cubit.dart';
import 'package:flutter_basic_base/presentation/pages/login/ui/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum RouteDefine {
  loginScreen,
  homeScreen,
  feedScreen,
}

class GenerateRoute {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    final routes = <String, WidgetBuilder>{
      RouteDefine.loginScreen.name: (_) =>
          widgetBuilder(const LoginScreen(), cubit: LoginCubit()),
      RouteDefine.homeScreen.name: (_) =>
          widgetBuilder(cubit: HomeCubit(), const HomeScreen()),
      RouteDefine.feedScreen.name: (_) => widgetBuilder(const FeedScreen()),
    };

    final routeBuilder = routes[settings.name];

    return MaterialPageRoute(
      builder: (context) => routeBuilder!(context),
      settings: RouteSettings(name: settings.name),
    );
  }

  static Widget widgetBuilder<T extends Cubit, S extends Widget>(
    S screen, {
    List<T>? listCubits,
    T? cubit,
  }) {
    return listCubits == null && cubit == null
        ? screen
        : MultiBlocProvider(
            providers: [
              if (cubit != null)
                BlocProvider<T>(
                  create: (context) => cubit,
                ),
              if (listCubits != null)
                ...listCubits.map(
                  (c) => BlocProvider<T>(
                    create: (context) => c,
                  ),
                )
            ],
            child: screen,
          );
  }
}
