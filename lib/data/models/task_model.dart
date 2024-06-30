class TaskModel {
  String? id;
  String? title;
  String? description;
  int? timestamp;
  String? status;

  TaskModel(
      {this.id = "0",
      this.title = "",
      this.description = "",
      this.timestamp = 0,
      this.status = ""});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        timestamp: json['timestamp'],
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['timestamp'] = timestamp;
    data['status'] = status;
    return data;
  }
}
