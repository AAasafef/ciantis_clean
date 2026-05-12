import 'package:flutter/material.dart';

import 'app_items.dart';

import '../screens/calendar/calendar_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/finances/finances_screen.dart';
import '../screens/goals/goals_screen.dart';
import '../screens/habits/habits_screen.dart';
import '../screens/journal/journal_screen.dart';
import '../screens/self_care/self_care_screen.dart';
import '../screens/settings/settings_screen.dart';

const List<AppItem> ciantisApps = [

  AppItem(
    title: 'Home',
    icon: Icons.home_outlined,
    screen: DashboardScreen(),
  ),

  AppItem(
    title: 'Goals',
    icon: Icons.favorite_border,
    screen: GoalsScreen(),
  ),

  AppItem(
    title: 'Habits',
    icon: Icons.check_circle_outline,
    screen: HabitsScreen(),
  ),

  AppItem(
    title: 'Journal',
    icon: Icons.menu_book_outlined,
    screen: JournalScreen(),
  ),

  AppItem(
    title: 'Self Care',
    icon: Icons.spa_outlined,
    screen: SelfCareScreen(),
  ),

  AppItem(
    title: 'Finances',
    icon: Icons.account_balance_wallet_outlined,
    screen: FinancesScreen(),
  ),

  AppItem(
    title: 'Calendar',
    icon: Icons.calendar_month_outlined,
    screen: CalendarScreen(),
  ),

  AppItem(
    title: 'Settings',
    icon: Icons.settings_outlined,
    screen: SettingsScreen(),
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
    title: 'Notes',
    icon: Icons.edit_note_outlined,
  ),

  AppItem(
    title: 'Resources',
    icon: Icons.widgets_outlined,
  ),
];
