part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class GetTasksEvent extends HomeEvent {}

final class CreateTaskEvent extends HomeEvent {
  final String text;
  final Importance importance;
  final DateTime? deadline;

  CreateTaskEvent({
    required this.text,
    required this.importance,
    required this.deadline,
  });
}

final class GetTaskEvent extends HomeEvent {
  final String id;

  GetTaskEvent({required this.id});
}

final class UpdateTasksEvent extends HomeEvent {
  final int revision;
  final List<TodoTaskModel> tasks;

  UpdateTasksEvent({required this.revision, required this.tasks});
}

final class DeleteTaskEvent extends HomeEvent {
  final TodoTaskModel task;

  DeleteTaskEvent({required this.task});
}

final class EditTaskEvent extends HomeEvent {
  final TodoTaskModel task;

  EditTaskEvent({required this.task});
}
