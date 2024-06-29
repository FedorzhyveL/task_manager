import 'package:task_manager/domain/models/todo_task_model.dart';

abstract class TasksRepository {
  Future<List<TodoTaskModel>> getTasks();
  Future<List<TodoTaskModel>> updateTasks(
    int revision,
    List<TodoTaskModel> tasks,
  );
  Future<TodoTaskModel> editTask(
    int revision,
    TodoTaskModel todoTask,
  );
  Future<TodoTaskModel> getTask(String id);
  Future<TodoTaskModel> deleteTask(
    int revision,
    TodoTaskModel taskModel,
  );
  Future<TodoTaskModel> createTask(
    int revision,
    TodoTaskModel todoTask,
  );
}
