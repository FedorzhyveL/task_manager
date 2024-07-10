import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uuid/uuid.dart';

import 'package:task_manager/core/di.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/use_cases/create_task_use_case.dart';
import 'package:task_manager/domain/use_cases/delete_task_use_caase.dart';
import 'package:task_manager/domain/use_cases/edit_task_use_case.dart';
import 'package:task_manager/domain/use_cases/get_task_use_case.dart';
import 'package:task_manager/domain/use_cases/get_tasks_use_case.dart';
import 'package:task_manager/domain/use_cases/update_tasks_use_case.dart';
import 'package:task_manager/main.dart';

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
        UpdateTasksEvent() => _updateTasks(emit),
        DeleteTaskEvent() => await _deleteTask(emit, event),
        EditTaskEvent() => await _editTask(emit, event),
      },
    );
    add(GetTasksEvent());
  }

  Future<void> _getTasks(Emitter<HomeState> emit) async {
    try {
      final tasks = await _getTasksUseCase(null);
      emit(HomeLoaded(tasks: tasks));
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> _getTask(Emitter<HomeState> emit, GetTaskEvent event) async {
    try {
      await _getTaskUseCase(event.id);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> _createTask(Emitter<HomeState> emit, CreateTaskEvent event) async {
    try {
      final tasks = await _createTaskUseCase(
        TodoTaskModel(
          id: const Uuid().v4(),
          text: event.text,
          importance: event.importance,
          deadline: event.deadline,
          createdAt: DateTime.now(),
          changedAt: DateTime.now(),
          lastUpdatedBy: injector.get(instanceName: 'deviceId'),
        ),
      );
      emit(HomeLoaded(tasks: tasks));
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> _updateTasks(Emitter<HomeState> emit) async {
    try {
      _updateTasksUseCase(null);
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> _deleteTask(Emitter<HomeState> emit, DeleteTaskEvent event) async {
    try {
      final tasks = await _deleteTaskUseCase(event.task);
      emit(HomeLoaded(tasks: tasks));
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> _editTask(Emitter<HomeState> emit, EditTaskEvent event) async {
    try {
      final tasks = await _editTaskUseCase(event.task);
      emit(HomeLoaded(tasks: tasks));
    } catch (e) {
      logger.e(e);
    }
  }
}
