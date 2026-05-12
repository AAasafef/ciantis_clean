import 'package:flutter/material.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/placeholder_page.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CiantisScreenShell(
      child: PlaceholderPage(
        title: 'Journal',
        subtitle:
            'Thoughts, reflections, memories, ideas, and emotional tracking.',
        icon: Icons.menu_book_outlined,
      ),
    );
  }
}
