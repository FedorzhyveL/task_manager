import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/presentation/home_screen/home_screen.dart';
import 'package:task_manager/presentation/task_screen/task_screen.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: '/task',
          page: TaskRoute.page,
        ),
      ];
}
