import '../models/task_model.dart';

class TasksService {
  static final TasksService instance =
      TasksService._internal();

  TasksService._internal();

  final List<TaskModel> _tasks = [

    TaskModel(
      id: '1',
      title: 'Morning skincare routine',
      completed: true,
      createdAt: DateTime.now(),
    ),

    TaskModel(
      id: '2',
      title: 'Drink 64oz water',
      completed: false,
      createdAt: DateTime.now(),
    ),

    TaskModel(
      id: '3',
      title: 'Study nursing material',
      completed: false,
      createdAt: DateTime.now(),
    ),
  ];

  List<TaskModel> getTasks() {
    return _tasks;
  }

  void addTask(
    TaskModel task,
  ) {
    _tasks.insert(0, task);
  }

  void deleteTask(
    String id,
  ) {
    _tasks.removeWhere(
      (task) => task.id == id,
    );
  }

  void toggleTask(
    String id,
  ) {
    final index = _tasks.indexWhere(
      (task) => task.id == id,
    );

    if (index != -1) {

      final task = _tasks[index];

      _tasks[index] =
          task.copyWith(
        completed: !task.completed,
      );
    }
  }
}
