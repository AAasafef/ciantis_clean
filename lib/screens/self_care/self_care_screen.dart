import 'package:flutter/material.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/placeholder_page.dart';

class SelfCareScreen extends StatelessWidget {
  const SelfCareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CiantisScreenShell(
      child: PlaceholderPage(
        title: 'Self Care',
        subtitle:
            'Beauty, wellness, skincare, hygiene, rest, and mental peace.',
        icon: Icons.spa_outlined,
      ),
    );
  }
}
