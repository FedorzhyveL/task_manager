import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/datasources/local_datasource/local_datasource_keys.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';

class LocalDatasource {
  final SharedPreferences _sharedPreferences;

  LocalDatasource({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  int getRevision() {
    return _sharedPreferences.getInt(LocalDatasourceKeys.revisionKey) ?? -1;
  }

  Future<bool> setRevision(int revision) async {
    return await _sharedPreferences.setInt(
        LocalDatasourceKeys.revisionKey, revision);
  }

  List<TodoTaskModel> getTasks() {
    final tasks = _sharedPreferences
            .getStringList(LocalDatasourceKeys.tasksKye)
            ?.map(
              (e) => TodoTaskModel.fromJson(jsonDecode(e)),
            )
            .toList() ??
        [];
    return tasks;
  }

  Future<bool> setTasks(List<TodoTaskModel> tasks) async {
    final stringedTasks = tasks.map((e) => jsonEncode(e)).toList();
    return await _sharedPreferences.setStringList(
      LocalDatasourceKeys.tasksKye,
      stringedTasks,
    );
  }
}
