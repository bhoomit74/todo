import 'package:todo/data/models/task_model.dart';
import 'package:todo/domain/entities/task.dart';
import 'package:todo/domain/enums/status.dart';
import 'package:todo/domain/helpers/date_format.dart';

class TaskMapper {
  static Task toEntity(TaskModel taskModel) {
    return Task(
        id: taskModel.id ?? '0',
        title: taskModel.title ?? "",
        description: taskModel.description ?? "",
        status: Status.fromName(taskModel.status),
        timestamp: taskModel.timestamp ?? 0,
        date: DateFormatter().getDateFromTimeStamp(taskModel.timestamp ?? 0));
  }

  static TaskModel toModel(Task task) {
    return TaskModel(
        id: task.id,
        title: task.title,
        description: task.description,
        status: task.status.name,
        timestamp: task.timestamp);
  }
}
