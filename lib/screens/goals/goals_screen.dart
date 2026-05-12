import 'package:flutter/material.dart';

import '../../models/goal_model.dart';

import '../../services/goals_service.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/luxury_button.dart';
import '../../widgets/luxury_card.dart';
import '../../widgets/luxury_page_padding.dart';
import '../../widgets/luxury_scroll_view.dart';
import '../../widgets/luxury_section_spacing.dart';
import '../../widgets/page_header.dart';
import '../../widgets/progress_ring.dart';
import '../../widgets/section_title.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final dailyGoals =
        GoalsService.instance
            .getGoalsByCategory(
      'Daily Focus',
    );

    final longTermGoals =
        GoalsService.instance
            .getGoalsByCategory(
      'Long-Term Vision',
    );

    return CiantisScreenShell(
      child: LuxuryPagePadding(
        child: LuxuryScrollView(
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

              ...dailyGoals.map(
                (goal) =>
                    _goalCard(goal),
              ),

              const LuxurySectionSpacing(),

              // LONG TERM
              const SectionTitle(
                title:
                    'Long-Term Vision',
              ),

              ...longTermGoals.map(
                (goal) =>
                    _goalCard(goal),
              ),

              const LuxurySectionSpacing(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _goalCard(
    GoalModel goal,
  ) {
    return LuxuryCard(
      icon: _goalIcon(goal.title),

      title: goal.title,

      subtitle: goal.subtitle,

      trailing: ProgressRing(
        text:
            '${(goal.progress * 100).toInt()}%',
      ),
    );
  }

  IconData _goalIcon(
    String title,
  ) {
    switch (title) {

      case 'Self Care Routine':
        return Icons.spa_outlined;

      case 'Read 20 Pages':
        return Icons.menu_book_outlined;

      case 'Workout':
        return Icons
            .fitness_center_outlined;

      case 'Financial Freedom':
        return Icons
            .account_balance_wallet_outlined;

      case 'Nursing School':
        return Icons.school_outlined;

      case 'Dream Home':
        return Icons.home_outlined;

      default:
        return Icons.flag_outlined;
    }
  }
}
