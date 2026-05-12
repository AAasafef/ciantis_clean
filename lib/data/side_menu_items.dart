import 'package:flutter/material.dart';

class SideMenuItem {
  final String title;
  final IconData icon;

  const SideMenuItem({
    required this.title,
    required this.icon,
  });
}

const List<SideMenuItem> sideMenuItems = [
  SideMenuItem(
    title: 'Home',
    icon: Icons.home_outlined,
  ),
  SideMenuItem(
    title: 'Goals',
    icon: Icons.favorite_border,
  ),
  SideMenuItem(
    title: 'Habits',
    icon: Icons.check_circle_outline,
  ),
  SideMenuItem(
    title: 'Journal',
    icon: Icons.menu_book_outlined,
  ),
  SideMenuItem(
    title: 'Self Care',
    icon: Icons.spa_outlined,
  ),
  SideMenuItem(
    title: 'Settings',
    icon: Icons.settings_outlined,
  ),
];
