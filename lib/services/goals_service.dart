import '../models/goal_model.dart';

class GoalsService {
  static final GoalsService instance =
      GoalsService._internal();

  GoalsService._internal();

  final List<GoalModel> _goals = [

    GoalModel(
      id: '1',
      title: 'Self Care Routine',
      subtitle:
          'Complete morning skincare and hydration goals.',
      progress: .82,
      category: 'Daily Focus',
    ),

    GoalModel(
      id: '2',
      title: 'Read 20 Pages',
      subtitle:
          'Continue personal growth reading habit.',
      progress: .65,
      category: 'Daily Focus',
    ),

    GoalModel(
      id: '3',
      title: 'Workout',
      subtitle:
          'Complete wellness and movement routine.',
      progress: .40,
      category: 'Daily Focus',
    ),

    GoalModel(
      id: '4',
      title: 'Financial Freedom',
      subtitle:
          'Debt reduction + savings milestones.',
      progress: .21,
      category: 'Long-Term Vision',
    ),

    GoalModel(
      id: '5',
      title: 'Nursing School',
      subtitle:
          'Complete prerequisites and graduate.',
      progress: .54,
      category: 'Long-Term Vision',
    ),

    GoalModel(
      id: '6',
      title: 'Dream Home',
      subtitle:
          'Luxury wellness-centered living space.',
      progress: .12,
      category: 'Long-Term Vision',
    ),
  ];

  List<GoalModel> getGoals() {
    return _goals;
  }

  List<GoalModel> getGoalsByCategory(
    String category,
  ) {
    return _goals
        .where(
          (goal) =>
              goal.category == category,
        )
        .toList();
  }

  void addGoal(
    GoalModel goal,
  ) {
    _goals.add(goal);
  }

  void deleteGoal(
    String id,
  ) {
    _goals.removeWhere(
      (goal) => goal.id == id,
    );
  }
}
