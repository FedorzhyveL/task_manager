import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:task_manager/domain/models/todo_task_model.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@Freezed(toJson: false)
class TaskDto with _$TaskDto {
  const factory TaskDto({
    required String status,
    required TodoTaskModel element,
    required int revision,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoFromJson(json);
}

@Freezed(toJson: false)
class TasksDto with _$TasksDto {
  const factory TasksDto({
    required String status,
    required List<TodoTaskModel> list,
    required int revision,
  }) = _TasksDto;

  factory TasksDto.fromJson(Map<String, dynamic> json) =>
      _$TasksDtoFromJson(json);
}
