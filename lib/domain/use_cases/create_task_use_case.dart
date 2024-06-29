import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/repositories/tasks_repository.dart';
import 'package:task_manager/domain/use_cases/base_use_case.dart';

class CreateTaskUseCase extends BaseUseCase<TodoTaskModel, CreateTaskParams> {
  final TasksRepository _tasksRepository;

  CreateTaskUseCase({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  @override
  Future<TodoTaskModel> call(params) async {
    try {
      return await _tasksRepository.createTask(
        params.revision,
        params.todoTask,
      );
    } catch (e) {
      rethrow;
    }
  }
}

class CreateTaskParams {
  final int revision;
  final TodoTaskModel todoTask;

  CreateTaskParams({required this.revision, required this.todoTask});
}
