import 'package:flutter/material.dart';
import 'package:flutter_basic_base/base/base_screen.dart';
import 'package:flutter_basic_base/presentation/pages/home/cubit/home_cubit.dart';

import 'wigdet/bottom_navigation.dart';
import 'wigdet/tab_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeCubit> {
  @override
  Widget buildContent(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, snapshot) {
        return WillPopScope(
          onWillPop: () async {
            final isFirstRouteInCurrentTab = !await cubit
                .navigatorKeys[cubit.currentTab]!.currentState!
                .maybePop();
            if (isFirstRouteInCurrentTab) {
              // if not on the 'main' tab
              if (cubit.currentTab != TabItem.feed) {
                // select 'main' tab
                cubit.changeBottomTab(tabItem: TabItem.feed);
                // back button handled by app
                return false;
              }
            }
            // let system handle back button if we're on the first route
            return isFirstRouteInCurrentTab;
          },
          child: Scaffold(
            body: Stack(
              children: cubit.bottomTabs
                  .map(
                    (bottomItem) => bottomItem.page(
                      cubit.currentTab,
                      cubit.currentNavigatorKey,
                    ),
                  )
                  .toList(),
            ),
            bottomNavigationBar: BottomNavigation(
              currentTab: cubit.currentTab,
              onSelectTab: (selectTab) {
                cubit.changeBottomTab(tabItem: selectTab);
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {
                cubit.changeBottomTab(tabItem: TabItem.dating);
              },
              child: Icon(
                TabItem.dating.getIcon,
                color: cubit.currentTab == TabItem.dating
                    ? Colors.red
                    : Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  afterBuild() {}
}
