import 'package:flutter/material.dart';
import 'package:flutter_basic_base/presentation/pages/home/cubit/home_cubit.dart';

import 'tab_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.currentTab,
    required this.onSelectTab,
  }) : super(key: key);

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeCubit>();
    return BottomAppBar(
      color: Colors.black,
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildItem(TabItem.feed, bloc),
            _buildItem(TabItem.friend, bloc),
            const SizedBox(width: 5),
            _buildItem(TabItem.setting, bloc),
            _buildItem(TabItem.profile, bloc),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(TabItem tabItem, HomeCubit cubit) {
    Color color = cubit.currentTab == tabItem ? Colors.red : Colors.white;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () {
          onSelectTab(tabItem);
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                tabItem.getIcon,
                color: color,
              ),
              const SizedBox(height: 8),
              Text(
                tabItem.getTabName,
                style: TextStyle(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
