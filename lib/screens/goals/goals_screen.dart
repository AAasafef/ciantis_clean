import 'package:flutter/material.dart';

import '../../models/goal_model.dart';

import '../../services/goals_service.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/luxury_button.dart';
import '../../widgets/luxury_card.dart';
import '../../widgets/luxury_dialog.dart';
import '../../widgets/luxury_page_padding.dart';
import '../../widgets/luxury_scroll_view.dart';
import '../../widgets/luxury_section_spacing.dart';
import '../../widgets/luxury_text_field.dart';
import '../../widgets/page_header.dart';
import '../../widgets/progress_ring.dart';
import '../../widgets/section_title.dart';

class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() =>
      _GoalsScreenState();
}

class _GoalsScreenState
    extends State<GoalsScreen> {

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

                onPressed: () {
                  _showAddGoalDialog(
                    context,
                  );
                },
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

  // GOAL CARD
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

  // ADD DIALOG
  void _showAddGoalDialog(
    BuildContext context,
  ) {

    final titleController =
        TextEditingController();

    final subtitleController =
        TextEditingController();

    showDialog(
      context: context,

      builder: (context) {
        return LuxuryDialog(
          title: 'Create Goal',

          subtitle:
              'Add a new dream, focus, or milestone.',

          child: Column(
            children: [

              LuxuryTextField(
                hintText:
                    'Goal Title',

                icon:
                    Icons.flag_outlined,

                controller:
                    titleController,
              ),

              const SizedBox(
                height: 16,
              ),

              LuxuryTextField(
                hintText:
                    'Description',

                icon:
                    Icons.edit_outlined,

                controller:
                    subtitleController,
              ),

              const SizedBox(
                height: 24,
              ),

              LuxuryButton(
                text: 'Save Goal',

                icon:
                    Icons.save_outlined,

                onPressed: () {

                  GoalsService.instance
                      .addGoal(
                    GoalModel(
                      id: DateTime.now()
                          .millisecondsSinceEpoch
                          .toString(),

                      title:
                          titleController
                              .text,

                      subtitle:
                          subtitleController
                              .text,

                      progress: .0,

                      category:
                          'Daily Focus',
                    ),
                  );

                  Navigator.pop(
                    context,
                  );

                  setState(() {});
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ICONS
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
