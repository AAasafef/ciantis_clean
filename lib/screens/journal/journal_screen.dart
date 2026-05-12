import 'package:flutter/material.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/empty_state_card.dart';
import '../../widgets/luxury_button.dart';
import '../../widgets/luxury_page_padding.dart';
import '../../widgets/luxury_scroll_view.dart';
import '../../widgets/luxury_section_spacing.dart';
import '../../widgets/page_header.dart';
import '../../widgets/section_title.dart';

class JournalScreen extends StatelessWidget {
  const JournalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CiantisScreenShell(
      child: LuxuryPagePadding(
        child: LuxuryScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              // HEADER
              const PageHeader(
                title: 'Journal',
                subtitle:
                    'Capture thoughts, emotions, reflections, and memories.',
              ),

              const LuxurySectionSpacing(),

              // BUTTON
              LuxuryButton(
                text: 'New Journal Entry',
                icon: Icons.edit_note_outlined,
                onPressed: () {},
              ),

              const LuxurySectionSpacing(
                height: 36,
              ),

              // TODAY
              const SectionTitle(
                title: 'Today',
              ),

              const EmptyStateCard(
                icon: Icons.menu_book_outlined,
                title: 'No Entries Yet',
                subtitle:
                    'Your journal entries will appear here beautifully organized.',
              ),

              const LuxurySectionSpacing(),

              // PROMPTS
              const SectionTitle(
                title: 'Reflection Prompts',
              ),

              const EmptyStateCard(
                icon: Icons.lightbulb_outline,
                title: 'Daily Reflection',
                subtitle:
                    'What made you feel most alive today?',
              ),

              const LuxurySectionSpacing(),
            ],
          ),
        ),
      ),
    );
  }
}
