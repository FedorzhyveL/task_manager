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
      final tasks = localDatasource.getTasks();
      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TodoTaskModel>> createTask(TodoTaskModel todoTask) async {
    try {
      final localTasks = localDatasource.getTasks();
      final newTasks = localTasks..add(todoTask);
      await localDatasource.setTasks(newTasks);
      remoteDatasource
          .createTask(
            localDatasource.getRevision(),
            todoTask,
          )
          .then(
            (value) => localDatasource.setRevision(value.revision),
          );
      return newTasks;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<TodoTaskModel>> deleteTask(TodoTaskModel taskModel) async {
    try {
      final localTasks = localDatasource.getTasks();
      final newTasks = localTasks
        ..removeWhere(
          (element) => element.id == taskModel.id,
        );
      await localDatasource.setTasks(newTasks);
      remoteDatasource
          .deleteTask(
            localDatasource.getRevision(),
            taskModel,
          )
          .then(
            (value) => localDatasource.setRevision(value.revision),
          );
      return newTasks;
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
  Future<List<TodoTaskModel>> editTask(TodoTaskModel todoTask) async {
    try {
      final localTasks = localDatasource.getTasks();
      final taskIndex = localTasks.indexWhere((element) => element.id == todoTask.id);
      localTasks.replaceRange(taskIndex, taskIndex + 1, [todoTask]);
      remoteDatasource
          .editTask(
            localDatasource.getRevision(),
            todoTask,
          )
          .then(
            (value) => localDatasource.setRevision(value.revision),
          );
      return localTasks;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateTasks() async {
    try {
      final localTasks = localDatasource.getTasks();
      remoteDatasource
          .updateTasks(
        localDatasource.getRevision(),
        localTasks,
      )
          .then(
        (value) {
          localDatasource.setRevision(value.revision);
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
