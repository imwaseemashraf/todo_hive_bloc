import 'package:hive/hive.dart';
import 'package:todo_hive_bloc/models/task.dart';

class TodoService {
  late Box<Task> _tasks;

  Future<void> Init() async {
    Hive.registerAdapter(TaskAdapter());
    _tasks = await Hive.openBox<Task>('tasks');
  }

  List<Task> getTasks(final String username) {
    final tasks = _tasks.values.where((ele) => ele.user == username);
    return tasks.toList();
  }

  void addTask(final String task, final String username) {
    _tasks.add(Task(username, task, false));
  }

  void removeTask(final String task, final String username) async {
    final taskRemove = _tasks.values.firstWhere(
      (ele) => ele.task == task && ele.user == username,
    );
    return taskRemove.delete();
  }

  void updateTask(
    final String task,
    final String username, {
    final bool? completed,
  }) async {
    final taskToEdit = _tasks.values.firstWhere(
      (ele) => ele.task == task && ele.user == username,
    );
    final index = taskToEdit.key as int;
    await _tasks.put(
      index,
      Task(username, task, completed ?? taskToEdit.completed),
    );
  }
}
