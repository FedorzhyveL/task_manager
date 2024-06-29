import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'package:task_manager/core/di.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/domain/use_cases/create_task_use_case.dart';
import 'package:task_manager/domain/use_cases/delete_task_use_caase.dart';
import 'package:task_manager/domain/use_cases/edit_task_use_case.dart';
import 'package:task_manager/domain/use_cases/get_task_use_case.dart';
import 'package:task_manager/domain/use_cases/get_tasks_use_case.dart';
import 'package:task_manager/domain/use_cases/update_tasks_use_case.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/presentation/home_screen/bloc/home_bloc.dart';
import 'package:task_manager/presentation/task_screen/task_screen.dart';

part 'widgets/app_bar.dart';
part 'widgets/todo_item.dart';
part 'widgets/todo_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showCompleted = false;
  bool isAppBarOverscrolled = false;
  final _scrollController = ScrollController();
  bool showStaticAppBar = false;
  late final HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = HomeBloc(
      injector.get<GetTasksUseCase>(),
      injector.get<GetTaskUseCase>(),
      injector.get<UpdateTasksUseCase>(),
      injector.get<CreateTaskUseCase>(),
      injector.get<EditTaskUseCase>(),
      injector.get<DeleteTaskUseCase>(),
    );
    _scrollController.addListener(() {
      if (_scrollController.offset >= (15 + kToolbarHeight) && showStaticAppBar == false) {
        setState(() {
          showStaticAppBar = true;
        });
      } else if (_scrollController.offset < (15 + kToolbarHeight) && showStaticAppBar == true) {
        setState(() {
          showStaticAppBar = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _homeBloc,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F6F2),
        floatingActionButton: InkWell(
          onTap: () => Navigator.of(context).push<Map<String, dynamic>?>(
            MaterialPageRoute(
              builder: (context) => TaskScreen(
                homeBloc: _homeBloc,
              ),
            ),
          ),
          child: Container(
            height: 56,
            width: 56,
            decoration: const BoxDecoration(
              color: Color(0xff007aff),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                _HomeAppBar(
                  doneTasksAmount: (showCompleted ? state.doneTasks : state.tasks).length,
                  showCompleted: showCompleted,
                  onVisibilityChanged: () => setState(
                    () {
                      showCompleted = !showCompleted;
                    },
                  ),
                  showStaticAppBar: showStaticAppBar,
                ),
                state is HomeLoading
                    ? const SliverToBoxAdapter(
                        child: SizedBox(
                          height: 200,
                          width: 100,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      )
                    : _TodoList(
                        showCompleted: showCompleted,
                      ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
