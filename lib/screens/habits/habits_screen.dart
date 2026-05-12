import 'package:flutter/material.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/placeholder_page.dart';

class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CiantisScreenShell(
      child: PlaceholderPage(
        title: 'Habits',
        subtitle:
            'Track routines, consistency, discipline, and daily growth.',
        icon: Icons.check_circle_outline,
      ),
    );
  }
}
