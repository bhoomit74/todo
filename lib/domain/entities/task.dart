import 'package:todo/domain/enums/status.dart';

class Task {
  final String id;
  final String title;
  final String description;
  final String date;
  final Status status;
  final int timestamp;

  const Task(
      {this.id = "0",
      this.title = "-",
      this.description = "-",
      this.timestamp = 0,
      this.date = "-",
      this.status = Status.pending});

  factory Task.create({required String title, required String description}) {
    return Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: description,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        status: Status.pending);
  }

  Task copyWith({String? title, String? description, Status? status}) {
    return Task(
        id: id,
        title: title ?? this.title,
        description: description ?? this.description,
        timestamp: timestamp,
        status: status ?? this.status);
  }
}
