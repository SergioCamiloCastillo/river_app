class TodoEntity {
  final String id;
  final String description;
  final DateTime? completeAt;

  TodoEntity(
      {required this.id, required this.description, required this.completeAt});

  bool get done {
    return completeAt != null;
  }

  TodoEntity copyWith({String? id, String? description, DateTime? completeAt}) {
    return TodoEntity(
        id: id ?? this.id,
        description: description ?? this.description,
        completeAt: completeAt);
  }
}
