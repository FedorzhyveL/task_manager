// ignore_for_file: public_member_api_docs, sort_constructors_first
enum TodoTaskPriority {
  none,
  low,
  high;

  @override
  String toString() => switch (this) {
        TodoTaskPriority.none => 'Нет',
        TodoTaskPriority.low => 'Низкий',
        TodoTaskPriority.high => '!! Высокий',
      };
}

class TodoTaskModel {
  final String taskInfo;
  final bool done;
  final TodoTaskPriority taskPriority;
  final DateTime? taskDeadline;

  TodoTaskModel({
    required this.taskInfo,
    this.done = false,
    this.taskPriority = TodoTaskPriority.none,
    this.taskDeadline,
  });

  TodoTaskModel copyWith({
    String? taskInfo,
    bool? done,
    TodoTaskPriority? taskPriority,
    DateTime? taskDeadline,
  }) {
    return TodoTaskModel(
      taskInfo: taskInfo ?? this.taskInfo,
      done: done ?? this.done,
      taskPriority: taskPriority ?? this.taskPriority,
      taskDeadline: taskDeadline ?? this.taskDeadline,
    );
  }

  @override
  bool operator ==(covariant TodoTaskModel other) {
    if (identical(this, other)) return true;

    return other.taskInfo == taskInfo &&
        other.done == done &&
        other.taskPriority == taskPriority &&
        other.taskDeadline == taskDeadline;
  }

  @override
  int get hashCode => taskInfo.hashCode ^ done.hashCode ^ taskPriority.hashCode ^ taskDeadline.hashCode;

  @override
  String toString() => 'TodoTaskModel(taskInfo: $taskInfo, done: $done,'
      ' taskPriority: $taskPriority, taskDeadline: $taskDeadline)';
}
