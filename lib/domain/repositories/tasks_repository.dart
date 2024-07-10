import 'package:task_manager/domain/models/todo_task_model.dart';

abstract class TasksRepository {
  Future<List<TodoTaskModel>> getTasks();
  Future<void> updateTasks();
  Future<List<TodoTaskModel>> editTask(TodoTaskModel todoTask);
  Future<TodoTaskModel> getTask(String id);
  Future<List<TodoTaskModel>> deleteTask(TodoTaskModel taskModel);
  Future<List<TodoTaskModel>> createTask(TodoTaskModel todoTask);
}
