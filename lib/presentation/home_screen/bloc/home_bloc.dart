import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/use_cases/create_task_use_case.dart';
import 'package:task_manager/domain/use_cases/delete_task_use_caase.dart';
import 'package:task_manager/domain/use_cases/edit_task_use_case.dart';
import 'package:task_manager/domain/use_cases/get_task_use_case.dart';
import 'package:task_manager/domain/use_cases/get_tasks_use_case.dart';
import 'package:task_manager/domain/use_cases/update_tasks_use_case.dart';
import 'package:task_manager/main.dart';
import 'package:uuid/uuid.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetTasksUseCase _getTasksUseCase;
  final GetTaskUseCase _getTaskUseCase;
  final UpdateTasksUseCase _updateTasksUseCase;
  final CreateTaskUseCase _createTaskUseCase;
  final EditTaskUseCase _editTaskUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  HomeBloc(
    this._getTasksUseCase,
    this._getTaskUseCase,
    this._updateTasksUseCase,
    this._createTaskUseCase,
    this._editTaskUseCase,
    this._deleteTaskUseCase,
  ) : super(HomeInitial()) {
    on<HomeEvent>(
      (event, emit) async => switch (event) {
        GetTasksEvent() => await _getTasks(emit),
        CreateTaskEvent() => await _createTask(emit, event),
        GetTaskEvent() => await _getTask(emit, event),
        UpdateTasksEvent() => await _updateTasks(emit, event),
        DeleteTaskEvent() => await _deleteTask(emit, event),
        EditTaskEvent() => await _editTask(emit, event),
      },
    );
    add(GetTasksEvent());
  }

  Future<void> _getTasks(Emitter<HomeState> emit) async {
    try {
      emit(
        HomeLoading(
          lastLoadedState: (state is HomeLoaded) ? state as HomeLoaded : null,
        ),
      );
      final tasks = await _getTasksUseCase(null);
      emit(HomeLoaded(tasks: tasks));
    } catch (e) {
      emit(
        (state is HomeLoading) ? (state as HomeLoading).lastLoadedState ?? HomeInitial() : HomeInitial(),
      );
      logger.e(e);
    }
  }

  Future<void> _getTask(Emitter<HomeState> emit, GetTaskEvent event) async {
    try {
      emit(
        HomeLoading(
          lastLoadedState: (state is HomeLoaded) ? state as HomeLoaded : null,
        ),
      );
      await _getTaskUseCase(event.id);
    } catch (e) {
      emit(
        (state is HomeLoading) ? (state as HomeLoading).lastLoadedState ?? HomeInitial() : HomeInitial(),
      );
      logger.e(e);
    }
  }

  Future<void> _createTask(Emitter<HomeState> emit, CreateTaskEvent event) async {
    try {
      emit(
        HomeLoading(
          lastLoadedState: (state is HomeLoaded) ? state as HomeLoaded : null,
        ),
      );
      await _createTaskUseCase(
        CreateTaskParams(
          revision: 1,
          todoTask: TodoTaskModel(
            id: const Uuid().v4(),
            text: event.text,
            importance: event.importance,
            deadline: event.deadline,
            createdAt: DateTime.now(),
            changedAt: DateTime.now(),
            lastUpdatedBy: '1',
          ),
        ),
      );
      await _getTasks(emit);
    } catch (e) {
      emit(
        (state is HomeLoading) ? (state as HomeLoading).lastLoadedState ?? HomeInitial() : HomeInitial(),
      );
      logger.e(e);
    }
  }

  Future<void> _updateTasks(Emitter<HomeState> emit, UpdateTasksEvent event) async {
    try {
      emit(
        HomeLoading(
          lastLoadedState: (state is HomeLoaded) ? state as HomeLoaded : null,
        ),
      );
      final tasks = await _updateTasksUseCase(
        UpdateTasksParams(
          revision: event.revision,
          tasks: event.tasks,
        ),
      );
      emit(HomeLoaded(tasks: tasks));
    } catch (e) {
      emit(
        (state is HomeLoading) ? (state as HomeLoading).lastLoadedState ?? HomeInitial() : HomeInitial(),
      );
      logger.e(e);
    }
  }

  Future<void> _deleteTask(Emitter<HomeState> emit, DeleteTaskEvent event) async {
    try {
      emit(
        HomeLoading(
          lastLoadedState: (state is HomeLoaded) ? state as HomeLoaded : null,
        ),
      );
      await _deleteTaskUseCase(
        DeleteTaskParams(
          revision: 2,
          todoTask: event.task,
        ),
      );
      await _getTasks(emit);
    } catch (e) {
      emit(
        (state is HomeLoading) ? (state as HomeLoading).lastLoadedState ?? HomeInitial() : HomeInitial(),
      );
      logger.e(e);
    }
  }

  Future<void> _editTask(Emitter<HomeState> emit, EditTaskEvent event) async {
    try {
      emit(
        HomeLoading(
          lastLoadedState: (state is HomeLoaded) ? state as HomeLoaded : null,
        ),
      );
      await _editTaskUseCase(
        EditTaskParams(
          revision: 4,
          todoTask: event.task,
        ),
      );
      await _getTasks(emit);
    } catch (e) {
      emit(
        (state is HomeLoading) ? (state as HomeLoading).lastLoadedState ?? HomeInitial() : HomeInitial(),
      );
      logger.e(e);
    }
  }
}
