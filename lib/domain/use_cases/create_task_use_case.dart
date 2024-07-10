import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/repositories/tasks_repository.dart';
import 'package:task_manager/domain/use_cases/base_use_case.dart';

class CreateTaskUseCase extends BaseUseCase<List<TodoTaskModel>, TodoTaskModel> {
  final TasksRepository _tasksRepository;

  CreateTaskUseCase({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  @override
  Future<List<TodoTaskModel>> call(params) async {
    try {
      return await _tasksRepository.createTask(params);
    } catch (e) {
      rethrow;
    }
  }
}
