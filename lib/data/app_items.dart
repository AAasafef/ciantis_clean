import 'package:flutter/material.dart';

class AppItem {
  final String title;
  final IconData icon;

  const AppItem({
    required this.title,
    required this.icon,
  });
}

const List<AppItem> ciantisApps = [

  AppItem(
    title: 'Home',
    icon: Icons.home_outlined,
  ),

  AppItem(
    title: 'Goals',
    icon: Icons.favorite_border,
  ),

  AppItem(
    title: 'Habits',
    icon: Icons.check_circle_outline,
  ),

  AppItem(
    title: 'Journal',
    icon: Icons.menu_book_outlined,
  ),

  AppItem(
    title: 'Self Care',
    icon: Icons.spa_outlined,
  ),

  AppItem(
    title: 'Finances',
    icon: Icons.account_balance_wallet_outlined,
  ),

  AppItem(
    title: 'Education',
    icon: Icons.school_outlined,
  ),

  AppItem(
    title: 'Wellness',
    icon: Icons.monitor_heart_outlined,
  ),

  AppItem(
    title: 'Projects',
    icon: Icons.folder_outlined,
  ),

  AppItem(
    title: 'Calendar',
    icon: Icons.calendar_month_outlined,
  ),

  AppItem(
    title: 'Notes',
    icon: Icons.edit_note_outlined,
  ),

  AppItem(
    title: 'Resources',
    icon: Icons.widgets_outlined,
  ),
];
