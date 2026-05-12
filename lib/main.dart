import 'package:flutter/material.dart';

import 'theme/ciantis_theme.dart';

import 'screens/dashboard/dashboard_screen.dart';

void main() {
  runApp(const CiantisApp());
}

class CiantisApp extends StatelessWidget {
  const CiantisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Ciantis',

      theme: CiantisTheme.themeData,

      home: const DashboardScreen(),
    );
  }
}
