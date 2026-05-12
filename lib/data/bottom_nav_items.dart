import 'package:flutter/material.dart';

class BottomNavItem {
  final String title;
  final IconData icon;

  const BottomNavItem({
    required this.title,
    required this.icon,
  });
}

const List<BottomNavItem> bottomNavItems = [
  BottomNavItem(
    title: 'Home',
    icon: Icons.home_outlined,
  ),
  BottomNavItem(
    title: 'Goals',
    icon: Icons.favorite_border,
  ),
  BottomNavItem(
    title: 'Calendar',
    icon: Icons.calendar_month_outlined,
  ),
  BottomNavItem(
    title: 'Profile',
    icon: Icons.person_outline,
  ),
];
