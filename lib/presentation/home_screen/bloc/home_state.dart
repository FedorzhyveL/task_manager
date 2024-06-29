part of 'home_bloc.dart';

@immutable
sealed class HomeState {
  List<TodoTaskModel> get tasks => switch (this) {
        HomeLoaded() => (this as HomeLoaded).tasks,
        HomeLoading() => (this as HomeLoading).lastLoadedState?.tasks ?? [],
        _ => [],
      };

  List<TodoTaskModel> get doneTasks {
    return switch (this) {
      HomeLoaded() => (this as HomeLoaded).tasks,
      HomeLoading() => (this as HomeLoading).lastLoadedState?.tasks ?? [],
      _ => <TodoTaskModel>[],
    }
        .where(
          (task) => task.done,
        )
        .toList();
  }
}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {
  final HomeLoaded? lastLoadedState;

  HomeLoading({this.lastLoadedState});
}

final class HomeLoaded extends HomeState {
  @override
  final List<TodoTaskModel> tasks;

  HomeLoaded({required this.tasks});
}
