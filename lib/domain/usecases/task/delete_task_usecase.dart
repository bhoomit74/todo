import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repositories/task_repository.dart';

class DeleteTaskUsecase {
  TaskRepository repository;

  DeleteTaskUsecase(this.repository);

  Future<void> call(Task task) async {
    repository.deleteTask(task);
  }
}
