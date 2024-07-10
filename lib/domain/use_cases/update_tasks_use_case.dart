import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/repositories/tasks_repository.dart';
import 'package:task_manager/domain/use_cases/base_use_case.dart';

class UpdateTasksUseCase extends BaseUseCase<List<TodoTaskModel>, UpdateTasksParams> {
  final TasksRepository _tasksRepository;

  UpdateTasksUseCase({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  @override
  Future<List<TodoTaskModel>> call(params) async {
    try {
      return await _tasksRepository.updateTasks(
        params.revision,
        params.tasks,
      );
    } catch (e) {
      rethrow;
    }
  }
}

class UpdateTasksParams {
  final int revision;
  final List<TodoTaskModel> tasks;

  UpdateTasksParams({
    required this.revision,
    required this.tasks,
  });
}
