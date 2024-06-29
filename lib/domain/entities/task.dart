class Task {
  final String id;
  final String title;
  final String description;
  final String date;
  final String status;

  const Task(
      {this.id = '0',
      this.title = "-",
      this.description = "-",
      this.date = "-",
      this.status = "-"});
}
