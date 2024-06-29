import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/repositories/tasks_repository.dart';
import 'package:task_manager/domain/use_cases/base_use_case.dart';

class GetTaskUseCase extends BaseUseCase<TodoTaskModel, String> {
  final TasksRepository _tasksRepository;

  GetTaskUseCase({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  @override
  Future<TodoTaskModel> call(params) async {
    try {
      return await _tasksRepository.getTask(params);
    } catch (e) {
      rethrow;
    }
  }
}
