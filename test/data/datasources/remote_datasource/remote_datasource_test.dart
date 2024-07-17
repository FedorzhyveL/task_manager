import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:task_manager/core/network/rest_client.dart';
import 'package:task_manager/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:task_manager/data/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:task_manager/data/dtos/task_dto.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';

void main() {
  late RestClientMok restClient;
  late RemoteDatasource remoteDatasource;
  late TodoTaskModel mockedTask;

  setUp(() {
    restClient = RestClientMok();
    mockedTask = TodoTaskModel(
      id: 'testId',
      text: '',
      importance: Importance.low,
      createdAt: DateTime(0),
      changedAt: DateTime(0),
      lastUpdatedBy: 'test',
    );

    when(
      () => restClient.createTask(
        any(that: isA<int>()),
        any(that: isA<Map<String, dynamic>>()),
      ),
    ).thenAnswer(
      (invocation) async {
        return TaskDto(
          status: 'OK',
          element: TodoTaskModel.fromJson(
              invocation.positionalArguments.last['element']),
          revision: invocation.positionalArguments.first + 1,
        );
      },
    );

    remoteDatasource = RemoteDatasourceImpl(restClient: restClient);
  });

  group('LocalDatasource', () {
    test(
        'и его метод setRevision должен записать ревизию в локальное хранилище',
        () async {
      //  arrange
      const currentRevision = 1;

      //  act
      final requestResult = await remoteDatasource.createTask(
        currentRevision,
        mockedTask,
      );

      //  assert
      expect(requestResult.status, same('OK'));
      expect(requestResult.revision, same(currentRevision + 1));
      expect(requestResult.element.id, same(mockedTask.id));
    });
  });
}

class RestClientMok extends Mock implements RestClient {}
