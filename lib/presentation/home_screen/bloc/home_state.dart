part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  List<TodoTaskModel> get tasks => switch (this) {
        HomeLoaded() => (this as HomeLoaded).tasks,
        _ => [],
      };

  List<TodoTaskModel> get doneTasks {
    return switch (this) {
      HomeLoaded() => (this as HomeLoaded).tasks,
      _ => <TodoTaskModel>[],
    }
        .where(
          (task) => task.done,
        )
        .toList();
  }
}

final class HomeInitial extends HomeState {}

final class HomeLoaded extends HomeState {
  @override
  final List<TodoTaskModel> tasks;

  HomeLoaded({required this.tasks});
}
