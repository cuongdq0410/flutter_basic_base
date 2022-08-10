import 'package:flutter/material.dart';
import 'package:flutter_basic_base/presentation/navigation/app_navigator.dart';
import 'package:flutter_basic_base/presentation/navigation/route_define.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            child: Center(child: Text('Feed')),
          ),
          ElevatedButton(
            onPressed: () {

              AppNavigator.navigateTo(context, RouteDefine.loginScreen.name);
            },
            child: const Text('Go to Login'),
          ),
        ],
      ),
    );
  }
}
