import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_manager/data/datasources/local_datasource/local_datasource.dart';
import 'package:task_manager/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:task_manager/data/repositories_impl/tasks_repository_impl.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/repositories/tasks_repository.dart';

void main() {
  late TasksRepository repository;
  late LocalDatasourceMok localDatasorce;
  late RemoteDatasourceMok remoteDatasource;
  setUp(() {
    localDatasorce = LocalDatasourceMok();
    remoteDatasource = RemoteDatasourceMok();

    when(() => localDatasorce.getTasks()).thenAnswer((_) => <TodoTaskModel>[]);
    when(() => remoteDatasource.getTasks()).thenAnswer((_) async => any());

    repository = TasksRepositoryImpl(
      localDatasource: localDatasorce,
      remoteDatasource: remoteDatasource,
    );
  });
  group('TaskRepository', () {
    test('и его метод getTasks должен вернуть List типа TodoTaskModel',
        () async {
      //  act
      final tasks = await repository.getTasks();

      //  assert
      expect(tasks, const TypeMatcher<List<TodoTaskModel>>());
    });
  });
}

class LocalDatasourceMok extends Mock implements LocalDatasource {}

class RemoteDatasourceMok extends Mock implements RemoteDatasource {}
