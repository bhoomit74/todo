enum Status {
  pending("Pending"),
  ongoing("Ongoing"),
  complete("Complete");

  const Status(this.name);

  final String name;

  static Status fromName(String? name) {
    return Status.values.singleWhere((element) => element.name == name,
        orElse: () => Status.pending);
  }
}
