class TaskDTO {
  TaskDTO({
    required this.createdAt,
    required this.title,
    required this.dueDate,
    required this.details,
    this.id,
  });
  late String? createdAt;
  late String? title;
  late String? avatar;
  late String? dueDate;
  late String? details;
  int? id;

  TaskDTO.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    title = json['title'];
    dueDate = json['dueDate'];
    details = json['details'];
    id = int.parse(json['id']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['createdAt'] = createdAt;
    _data['title'] = title;
    _data['dueDate'] = dueDate;
    _data['details'] = details;
    _data['id'] = id;
    return _data;
  }
}
