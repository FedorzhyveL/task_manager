import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/repositories/tasks_repository.dart';
import 'package:task_manager/domain/use_cases/base_use_case.dart';

class EditTaskUseCase extends BaseUseCase<TodoTaskModel, EditTaskParams> {
  final TasksRepository _tasksRepository;

  EditTaskUseCase({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  @override
  Future<TodoTaskModel> call(params) async {
    try {
      return await _tasksRepository.editTask(
        params.revision,
        params.todoTask,
      );
    } catch (e) {
      rethrow;
    }
  }
}

class EditTaskParams {
  final int revision;
  final TodoTaskModel todoTask;

  EditTaskParams({required this.revision, required this.todoTask});
}
