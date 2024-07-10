import 'package:task_manager/data/datasources/local_datasource/local_datasource.dart';
import 'package:task_manager/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/repositories/tasks_repository.dart';

class TasksRepositoryImpl implements TasksRepository {
  final LocalDatasource localDatasource;
  final RemoteDatasource remoteDatasource;

  TasksRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });

  @override
  Future<List<TodoTaskModel>> getTasks() async {
    try {
      final tasks = await remoteDatasource.getTasks();
      await localDatasource.setRevision(tasks.revision);
      await localDatasource.setTasks(tasks.list);
      return tasks.list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoTaskModel> createTask(int revision, TodoTaskModel todoTask) async {
    try {
      final task = await remoteDatasource.createTask(
        localDatasource.getRevision(),
        todoTask,
      );
      return task.element;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoTaskModel> deleteTask(int revision, TodoTaskModel taskModel) async {
    try {
      final task = await remoteDatasource.deleteTask(
        localDatasource.getRevision(),
        taskModel,
      );
      return task.element;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoTaskModel> getTask(String id) async {
    try {
      final task = await remoteDatasource.getTask(
        localDatasource.getRevision(),
        id,
      );
      return task.element;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TodoTaskModel> editTask(int revision, TodoTaskModel todoTask) async {
    try {
      final task = await remoteDatasource.editTask(
        localDatasource.getRevision(),
        todoTask,
      );
      return task.element;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TodoTaskModel>> updateTasks(int revision, List<TodoTaskModel> tasks) async {
    try {
      final updatedTasks = await remoteDatasource.updateTasks(
        localDatasource.getRevision(),
        tasks,
      );
      localDatasource.setRevision(updatedTasks.revision);
      localDatasource.setTasks(updatedTasks.list);
      return updatedTasks.list;
    } catch (e) {
      rethrow;
    }
  }
}
