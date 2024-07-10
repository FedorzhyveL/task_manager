import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/repositories/tasks_repository.dart';
import 'package:task_manager/domain/use_cases/base_use_case.dart';

class DeleteTaskUseCase extends BaseUseCase<TodoTaskModel, DeleteTaskParams> {
  final TasksRepository _tasksRepository;

  DeleteTaskUseCase({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  @override
  Future<TodoTaskModel> call(params) async {
    try {
      return await _tasksRepository.deleteTask(
        params.revision,
        params.todoTask,
      );
    } catch (e) {
      rethrow;
    }
  }
}

class DeleteTaskParams {
  final int revision;
  final TodoTaskModel todoTask;

  DeleteTaskParams({required this.revision, required this.todoTask});
}
