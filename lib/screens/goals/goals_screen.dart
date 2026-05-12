import 'package:flutter/material.dart';

import '../../theme/ciantis_theme.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/luxury_card.dart';
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

            // PAGE TITLE
            const Text(
              'Goals',
              style: TextStyle(
                color: CiantisTheme.white,
                fontSize: 38,
                fontWeight: FontWeight.w300,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Build the future you want.',
              style: TextStyle(
                color: CiantisTheme.whiteSoft,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 34),

            // DAILY GOALS
            const SectionTitle(
              title: 'Daily Focus',
            ),

            LuxuryCard(
              icon: Icons.spa_outlined,
              title: 'Self Care Routine',
              subtitle:
                  'Complete morning skincare and hydration goals.',
              trailing: _progressCircle('82%'),
            ),

            LuxuryCard(
              icon: Icons.menu_book_outlined,
              title: 'Read 20 Pages',
              subtitle:
                  'Continue personal growth reading habit.',
              trailing: _progressCircle('65%'),
            ),

            LuxuryCard(
              icon: Icons.fitness_center_outlined,
              title: 'Workout',
              subtitle:
                  'Complete wellness and movement routine.',
              trailing: _progressCircle('40%'),
            ),

            const SizedBox(height: 28),

            // LONG TERM
            const SectionTitle(
              title: 'Long-Term Vision',
            ),

            LuxuryCard(
              icon:
                  Icons.account_balance_wallet_outlined,
              title: 'Financial Freedom',
              subtitle:
                  'Debt reduction + savings milestones.',
              trailing: _progressCircle('21%'),
            ),

            LuxuryCard(
              icon: Icons.school_outlined,
              title: 'Nursing School',
              subtitle:
                  'Complete prerequisites and graduate.',
              trailing: _progressCircle('54%'),
            ),

            LuxuryCard(
              icon: Icons.home_outlined,
              title: 'Dream Home',
              subtitle:
                  'Luxury wellness-centered living space.',
              trailing: _progressCircle('12%'),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  static Widget _progressCircle(
    String text,
  ) {
    return Container(
      height: 54,
      width: 54,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(.25),
        ),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: CiantisTheme.white,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
