import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repositories/task_repository.dart';

class FetchTaskUsecase {
  final TaskRepository repository;

  FetchTaskUsecase(this.repository);

  Future<List<Task>> call() async {
    return await repository.fetchTasks();
  }
}
