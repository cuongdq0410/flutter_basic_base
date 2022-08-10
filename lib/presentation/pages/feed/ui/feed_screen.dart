import 'package:flutter/material.dart';
import 'package:flutter_basic_base/presentation/navigation/app_navigator.dart';
import 'package:flutter_basic_base/presentation/navigation/route_define.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              child: Center(child: Text('Feed')),
            ),
            ElevatedButton(
              onPressed: () {
                /// Nest Navigation
                AppNavigator.navigateTo(context, RouteDefine.loginScreen.name);

                /// Not nest navigation
                // AppNavigator.navigateTo(
                //     AppNavigator.currentContext!, RouteDefine.loginScreen.name);
              },
              child: const Text('Go to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
