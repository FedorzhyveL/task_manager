import 'package:task_manager/data/dtos/task_dto.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';

abstract class RemoteDatasource {
  Future<TasksDto> getTasks();
  Future<TasksDto> updateTasks(
    int revision,
    List<TodoTaskModel> tasks,
  );
  Future<TaskDto> getTask(
    int revision,
    String id,
  );
  Future<TaskDto> editTask(
    int revision,
    TodoTaskModel taskModel,
  );
  Future<TaskDto> createTask(
    int revision,
    TodoTaskModel taskModel,
  );
  Future<TaskDto> deleteTask(
    int revision,
    TodoTaskModel taskModel,
  );
}
