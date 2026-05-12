import 'package:flutter/material.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/placeholder_page.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CiantisScreenShell(
      child: PlaceholderPage(
        title: 'Goals',
        subtitle:
            'Your visions, dreams, milestones, and future plans.',
        icon: Icons.favorite_border,
      ),
    );
  }
}
