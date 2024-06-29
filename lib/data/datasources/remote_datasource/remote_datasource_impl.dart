import 'package:task_manager/core/network/rest_client.dart';
import 'package:task_manager/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:task_manager/data/dtos/task_dto.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';

class RemoteDatasourceImpl implements RemoteDatasource {
  final RestClient restClient;

  RemoteDatasourceImpl({
    required this.restClient,
  });

  @override
  Future<TaskDto> createTask(int revision, TodoTaskModel taskModel) async {
    try {
      final task = await restClient.createTask(
        revision,
        {
          'element': taskModel.toJson()
            ..removeWhere(
              (key, value) => value == null,
            )
        },
      );
      return task;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TaskDto> deleteTask(int revision, TodoTaskModel taskModel) async {
    try {
      final task = await restClient.deleteTask(
        taskModel.id,
        revision,
        {
          'element': taskModel.toJson()
            ..removeWhere(
              (key, value) => value == null,
            ),
        },
      );
      return task;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TaskDto> editTask(int revision, TodoTaskModel taskModel) async {
    try {
      final task = await restClient.editTask(
        revision,
        taskModel.id,
        {
          'element': taskModel.toJson()
            ..removeWhere(
              (key, value) => value == null,
            )
        },
      );
      return task;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TaskDto> getTask(int revision, String id) async {
    final task = await restClient.getTask(id, revision);
    return task;
  }

  @override
  Future<TasksDto> getTasks() async {
    try {
      final tasks = await restClient.getTasks();
      return tasks;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<TasksDto> updateTasks(int revision, List<TodoTaskModel> tasks) async {
    try {
      final updatedTasks = await restClient.updateTasks(
        revision,
        {
          'list': tasks
              .map(
                (e) => e.toJson()
                  ..removeWhere(
                    (key, value) => value == null,
                  ),
              )
              .toList(),
        },
      );
      return updatedTasks;
    } catch (e) {
      rethrow;
    }
  }
}
