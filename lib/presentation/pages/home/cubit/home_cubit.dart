import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_base/presentation/pages/home/ui/wigdet/tab_item.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  TabItem currentTab = TabItem.feed;
  var bottomTabs = [
    TabItem.feed,
    TabItem.friend,
    TabItem.dating,
    TabItem.setting,
    TabItem.profile
  ];

  final navigatorKeys = {
    TabItem.feed: GlobalKey<NavigatorState>(),
    TabItem.friend: GlobalKey<NavigatorState>(),
    TabItem.dating: GlobalKey<NavigatorState>(),
    TabItem.setting: GlobalKey<NavigatorState>(),
    TabItem.profile: GlobalKey<NavigatorState>(),
  };

  void changeBottomTab({required TabItem tabItem}) async {
    if (tabItem == currentTab && currentTab == TabItem.feed) {
      navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      currentTab = tabItem;
    }
    emit(ChangeTabState());
  }

  GlobalKey<NavigatorState>? get currentNavigatorKey =>
      navigatorKeys[currentTab];
}
