import 'package:flutter/material.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/luxury_button.dart';
import '../../widgets/luxury_card.dart';
import '../../widgets/luxury_section_spacing.dart';
import '../../widgets/page_header.dart';
import '../../widgets/progress_ring.dart';
import '../../widgets/section_title.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CiantisScreenShell(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [

            // HEADER
            const PageHeader(
              title: 'Goals',
              subtitle:
                  'Build the future you want.',
            ),

            const LuxurySectionSpacing(),

            // BUTTON
            LuxuryButton(
              text: 'Create New Goal',
              icon: Icons.add_rounded,
              onPressed: () {},
            ),

            const LuxurySectionSpacing(
              height: 34,
            ),

            // DAILY
            const SectionTitle(
              title: 'Daily Focus',
            ),

            const LuxuryCard(
              icon: Icons.spa_outlined,
              title: 'Self Care Routine',
              subtitle:
                  'Complete morning skincare and hydration goals.',
              trailing: ProgressRing(
                text: '82%',
              ),
            ),

            const LuxuryCard(
              icon: Icons.menu_book_outlined,
              title: 'Read 20 Pages',
              subtitle:
                  'Continue personal growth reading habit.',
              trailing: ProgressRing(
                text: '65%',
              ),
            ),

            const LuxuryCard(
              icon:
                  Icons.fitness_center_outlined,
              title: 'Workout',
              subtitle:
                  'Complete wellness and movement routine.',
              trailing: ProgressRing(
                text: '40%',
              ),
            ),

            const LuxurySectionSpacing(),

            // LONG TERM
            const SectionTitle(
              title: 'Long-Term Vision',
            ),

            const LuxuryCard(
              icon:
                  Icons.account_balance_wallet_outlined,
              title: 'Financial Freedom',
              subtitle:
                  'Debt reduction + savings milestones.',
              trailing: ProgressRing(
                text: '21%',
              ),
            ),

            const LuxuryCard(
              icon: Icons.school_outlined,
              title: 'Nursing School',
              subtitle:
                  'Complete prerequisites and graduate.',
              trailing: ProgressRing(
                text: '54%',
              ),
            ),

            const LuxuryCard(
              icon: Icons.home_outlined,
              title: 'Dream Home',
              subtitle:
                  'Luxury wellness-centered living space.',
              trailing: ProgressRing(
                text: '12%',
              ),
            ),

            const LuxurySectionSpacing(),
          ],
        ),
      ),
    );
  }
}
