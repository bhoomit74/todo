class Task {
  final String id;
  final String title;
  final String description;
  final String date;
  final String status;
  final int timestamp;

  const Task(
      {this.id = "0",
      this.title = "-",
      this.description = "-",
      this.timestamp = 0,
      this.date = "-",
      this.status = "-"});

  factory Task.create({required String title, required String description}) {
    return Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: title,
        description: description,
        timestamp: DateTime.now().millisecondsSinceEpoch,
        status: "Pending");
  }
}
