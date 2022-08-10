import 'package:flutter/material.dart';
import 'package:flutter_basic_base/presentation/navigation/route_define.dart';

enum TabItem {
  feed,
  friend,
  dating,
  setting,
  profile,
}

extension TabItemExtend on TabItem {
  String get getTabName {
    switch (this) {
      case TabItem.feed:
        return 'Feed';
      case TabItem.friend:
        return 'Friend';
      case TabItem.dating:
        return 'Dating';
      case TabItem.setting:
        return 'Setting';
      case TabItem.profile:
        return 'Profile';
    }
  }

  IconData get getIcon {
    switch (this) {
      case TabItem.feed:
        return Icons.dynamic_feed_outlined;
      case TabItem.friend:
        return Icons.child_friendly_sharp;
      case TabItem.dating:
        return Icons.dashboard;
      case TabItem.setting:
        return Icons.settings;
      case TabItem.profile:
        return Icons.person;
    }
  }

  Widget page(
    TabItem currentTabItem,
    GlobalKey<NavigatorState>? key,
  ) {
    switch (this) {
      case TabItem.feed:
        return Offstage(
          offstage: currentTabItem != this,

          /// Handle nest navigation
          child: Navigator(
            key: key,
            initialRoute: RouteDefine.feedScreen.name,
            onGenerateRoute: GenerateRoute.generateRoute,
          ),
        );
      case TabItem.friend:
        return Offstage(
          offstage: currentTabItem != this,
          child: const SizedBox(
            child: Center(child: Text('Friends')),
          ),
        );
      case TabItem.dating:
        return Offstage(
          offstage: currentTabItem != this,
          child: const SizedBox(
            child: Center(child: Text('Dating')),
          ),
        );
      case TabItem.setting:
        return Offstage(
          offstage: currentTabItem != this,
          child: const SizedBox(
            child: Center(child: Text('Setting')),
          ),
        );
      case TabItem.profile:
        return Offstage(
          offstage: currentTabItem != this,
          child: const SizedBox(
            child: Center(child: Text('Profile')),
          ),
        );
    }
  }
}
