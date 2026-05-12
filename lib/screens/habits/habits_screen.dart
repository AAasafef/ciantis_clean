import 'package:flutter/material.dart';

import '../../models/task_model.dart';

import '../../services/tasks_service.dart';

import '../../widgets/ciantis_screen_shell.dart';
import '../../widgets/luxury_button.dart';
import '../../widgets/luxury_dialog.dart';
import '../../widgets/luxury_page_padding.dart';
import '../../widgets/luxury_scroll_view.dart';
import '../../widgets/luxury_section_spacing.dart';
import '../../widgets/luxury_text_field.dart';
import '../../widgets/page_header.dart';
import '../../widgets/section_title.dart';
import '../../widgets/task_tile.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() =>
      _HabitsScreenState();
}

class _HabitsScreenState
    extends State<HabitsScreen> {

  @override
  Widget build(BuildContext context) {

    final tasks =
        TasksService.instance
            .getTasks();

    return CiantisScreenShell(
      child: LuxuryPagePadding(
        child: LuxuryScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [

              // HEADER
              const PageHeader(
                title: 'Habits',
                subtitle:
                    'Build consistency and daily discipline.',
              ),

              const LuxurySectionSpacing(),

              // BUTTON
              LuxuryButton(
                text: 'Add Habit',
                icon: Icons.add_rounded,

                onPressed: () {
                  _showAddTaskDialog(
                    context,
                  );
                },
              ),

              const LuxurySectionSpacing(
                height: 36,
              ),

              // TASKS
              const SectionTitle(
                title: 'Daily Habits',
              ),

              ...tasks.map(
                (task) =>
                    TaskTile(
                  task: task,

                  onToggle: () {

                    TasksService.instance
                        .toggleTask(
                      task.id,
                    );

                    setState(() {});
                  },

                  onDelete: () {

                    TasksService.instance
                        .deleteTask(
                      task.id,
                    );

                    setState(() {});
                  },
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

  // ADD TASK
  void _showAddTaskDialog(
    BuildContext context,
  ) {

    final controller =
        TextEditingController();

    showDialog(
      context: context,

      builder: (dialogContext) {
        return LuxuryDialog(
          title: 'Add Habit',

          subtitle:
              'Create a new routine or daily task.',

          child: Column(
            children: [

              LuxuryTextField(
                hintText:
                    'Habit Title',

                icon:
                    Icons.check_circle_outline,

                controller:
                    controller,
              ),

              const SizedBox(
                height: 24,
              ),

              LuxuryButton(
                text: 'Save Habit',

                icon:
                    Icons.save_outlined,

                onPressed: () {

                  TasksService.instance
                      .addTask(
                    TaskModel(
                      id: DateTime.now()
                          .millisecondsSinceEpoch
                          .toString(),

                      title:
                          controller.text,

                      completed:
                          false,

                      createdAt:
                          DateTime.now(),
                    ),
                  );

                  Navigator.pop(
                    dialogContext,
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
}
