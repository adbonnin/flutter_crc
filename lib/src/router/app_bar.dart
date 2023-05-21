import 'package:flutter/material.dart';

class AppBarItem {
  const AppBarItem({
    required this.icon,
    required this.labelBuilder,
    required this.location,
  });

  final IconData icon;
  final String Function(BuildContext context) labelBuilder;
  final String location;
}

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final List<AppBarItem> items;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items.map((item) => _buildItem(context, item)).toList(),
      onTap: onTap,
      currentIndex: currentIndex,
    );
  }

  BottomNavigationBarItem _buildItem(BuildContext context, AppBarItem item) {
    return BottomNavigationBarItem(
      icon: Icon(item.icon),
      label: item.labelBuilder(context),
    );
  }
}