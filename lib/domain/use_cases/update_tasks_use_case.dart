import 'package:task_manager/domain/repositories/tasks_repository.dart';
import 'package:task_manager/domain/use_cases/base_use_case.dart';

class UpdateTasksUseCase extends BaseUseCase<void, dynamic> {
  final TasksRepository _tasksRepository;

  UpdateTasksUseCase({
    required TasksRepository tasksRepository,
  }) : _tasksRepository = tasksRepository;

  @override
  Future<void> call(params) async {
    try {
      return _tasksRepository.updateTasks();
    } catch (e) {
      rethrow;
    }
  }
}
