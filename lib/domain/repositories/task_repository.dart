import 'package:todo/domain/entities/task.dart';

abstract class TaskRepository {
  Future<List<Task>> fetchTasks();
  Future<void> addTask(Task task);
  Future<void> deleteTask(Task task);
}
