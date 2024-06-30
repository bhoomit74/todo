import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/data/mappers/task_mapper.dart';
import 'package:todo/data/models/task_model.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/repositories/task_repository.dart';
import 'package:todo/domain/usecases/user/user_usecase.dart';
import 'package:todo/presentation/utils/helper/locator.dart';

class TaskRepositoryImpl implements TaskRepository {
  var dbPath = FirebaseFirestore.instance.collection('todo-app');
  @override
  Future<void> addTask(Task task) async {
    try {
      var user = locator<UserUsecase>().getUser();
      TaskModel taskModel = TaskMapper.toModel(task);
      dbPath
          .doc(user.id)
          .collection('tasks')
          .doc(taskModel.id)
          .set(taskModel.toJson());
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<Task>> fetchTasks() async {
    List<Task> tasks = [];
    try {
      var user = locator<UserUsecase>().getUser();
      var value = await dbPath.doc(user.id).collection('tasks').get();

      for (var doc in value.docs) {
        doc.data()['id'] = doc.id;
        tasks.add(TaskMapper.toEntity(TaskModel.fromJson(doc.data())));
      }

      return tasks;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      var user = locator<UserUsecase>().getUser();
      await dbPath.doc(user.id).collection('tasks').doc(task.id).delete();
    } catch (e) {
      throw e.toString();
    }
  }
}
