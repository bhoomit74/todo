import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repositories/task_repository.dart';

class AddTaskUsecase {
  TaskRepository repository;

  AddTaskUsecase(this.repository);

  Future<List<Task>> call(Task task) async {
    await repository.addTask(task);
    return repository.fetchTasks();
  }
}
