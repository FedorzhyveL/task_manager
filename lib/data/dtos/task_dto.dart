import 'package:json_annotation/json_annotation.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';

part 'task_dto.g.dart';

@JsonSerializable(createToJson: false)
class TaskDto {
  final String status;
  final TodoTaskModel element;
  final int revision;

  TaskDto({
    required this.status,
    required this.element,
    required this.revision,
  });

  factory TaskDto.fromJson(Map<String, dynamic> json) => _$TaskDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class TasksDto {
  final String status;
  final List<TodoTaskModel> list;
  final int revision;

  TasksDto({
    required this.status,
    required this.list,
    required this.revision,
  });

  factory TasksDto.fromJson(Map<String, dynamic> json) => _$TasksDtoFromJson(json);
}
