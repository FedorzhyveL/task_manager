import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/data/datasources/local_datasource/local_datasource.dart';
import 'package:task_manager/data/datasources/local_datasource/local_datasource_keys.dart';

void main() {
  late SharedPreferencesMok database;
  late LocalDatasource localDatasource;

  setUp(() {
    database = SharedPreferencesMok();

    when(() => database.setInt(
            LocalDatasourceKeys.revisionKey, any(that: isA<int>())))
        .thenAnswer((_) async => true);

    localDatasource = LocalDatasource(sharedPreferences: database);
  });

  group('LocalDatasource', () {
    test(
        'и его метод setRevision должен записать ревизию в локальное хранилище',
        () async {
      //  arrange
      const expectedRevision = 42;

      //  act
      await localDatasource.setRevision(expectedRevision);

      //  assert
      final revision = localDatasource.getRevision();

      expect(revision, same(expectedRevision));
    });
  });
}

class SharedPreferencesMok extends Mock implements SharedPreferences {}
