import 'package:flutter/material.dart';

import '../../services/journal_service.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/journal_entry_card.dart';
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

    final entries =
        JournalService.instance
            .getEntries();

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
                icon:
                    Icons.edit_note_outlined,
                onPressed: () {},
              ),

              const LuxurySectionSpacing(
                height: 36,
              ),

              // ENTRIES
              const SectionTitle(
                title: 'Recent Entries',
              ),

              ...entries.map(
                (entry) =>
                    JournalEntryCard(
                  entry: entry,
                ),
              ),

              const LuxurySectionSpacing(
                height: 120,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
