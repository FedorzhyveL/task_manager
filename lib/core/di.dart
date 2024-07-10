import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/core/network/custom_interceptors/base_intercceptor.dart';
import 'package:task_manager/core/network/rest_client.dart';
import 'package:task_manager/data/datasources/local_datasource/local_datasource.dart';
import 'package:task_manager/data/datasources/remote_datasource/remote_datasource.dart';
import 'package:task_manager/data/datasources/remote_datasource/remote_datasource_impl.dart';
import 'package:task_manager/data/repositories_impl/tasks_repository_impl.dart';
import 'package:task_manager/domain/repositories/tasks_repository.dart';
import 'package:task_manager/domain/use_cases/create_task_use_case.dart';
import 'package:task_manager/domain/use_cases/delete_task_use_caase.dart';
import 'package:task_manager/domain/use_cases/edit_task_use_case.dart';
import 'package:task_manager/domain/use_cases/get_task_use_case.dart';
import 'package:task_manager/domain/use_cases/get_tasks_use_case.dart';
import 'package:task_manager/domain/use_cases/update_tasks_use_case.dart';
import 'package:task_manager/presentation/navigation/app_router.dart';

final injector = GetIt.I;

Future<void> inject() async {
  injector.registerLazySingleton<RestClient>(() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://hive.mrdekk.ru/todo',
        connectTimeout: const Duration(minutes: 1),
        headers: {'Authorization': 'Bearer ${const String.fromEnvironment('API_TOKEN')}'},
      ),
    );
    dio.interceptors.addAll(
      [
        LogInterceptor(
          requestBody: true,
          responseBody: true,
        ),
        BaseInterceptor(),
      ],
    );
    return RestClient(dio);
  });

  injector.registerSingletonAsync<String>(
    instanceName: 'deviceId',
    () async {
      final deviceInfo = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        return (await deviceInfo.androidInfo).id;
      } else if (Platform.isIOS) {
        return (await deviceInfo.iosInfo).identifierForVendor ?? '1';
      } else {
        return '1';
      }
    },
  );

  injector.registerLazySingleton<Connectivity>(() => Connectivity());

  injector.registerLazySingleton<AppRouter>(() => AppRouter());

  await _registerDatasources();
  _registerRepositories();
  _registerUseCases();
}

Future<void> _registerDatasources() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton<LocalDatasource>(
    () => LocalDatasource(sharedPreferences: sharedPreferences),
  );

  injector.registerLazySingleton<RemoteDatasource>(
    () => RemoteDatasourceImpl(restClient: injector.get<RestClient>()),
  );
}

void _registerRepositories() {
  injector.registerLazySingleton<TasksRepository>(
    () => TasksRepositoryImpl(
      localDatasource: injector.get<LocalDatasource>(),
      remoteDatasource: injector.get<RemoteDatasource>(),
    ),
  );
}

void _registerUseCases() {
  injector.registerLazySingleton<GetTasksUseCase>(
    () => GetTasksUseCase(
      tasksRepository: injector.get<TasksRepository>(),
    ),
  );
  injector.registerLazySingleton<GetTaskUseCase>(
    () => GetTaskUseCase(
      tasksRepository: injector.get<TasksRepository>(),
    ),
  );
  injector.registerLazySingleton<UpdateTasksUseCase>(
    () => UpdateTasksUseCase(
      tasksRepository: injector.get<TasksRepository>(),
    ),
  );
  injector.registerLazySingleton<DeleteTaskUseCase>(
    () => DeleteTaskUseCase(
      tasksRepository: injector.get<TasksRepository>(),
    ),
  );
  injector.registerLazySingleton<EditTaskUseCase>(
    () => EditTaskUseCase(
      tasksRepository: injector.get<TasksRepository>(),
    ),
  );
  injector.registerLazySingleton<CreateTaskUseCase>(
    () => CreateTaskUseCase(
      tasksRepository: injector.get<TasksRepository>(),
    ),
  );
}
