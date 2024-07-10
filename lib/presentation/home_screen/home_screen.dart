import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'package:task_manager/core/di.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/presentation/home_screen/bloc/home_bloc.dart';
import 'package:task_manager/presentation/navigation/app_router.dart';

part 'widgets/app_bar.dart';
part 'widgets/todo_item.dart';
part 'widgets/todo_list.dart';

@RoutePage()
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
  late final Connectivity connectivity;

  @override
  void initState() {
    super.initState();

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

    _homeBloc = context.read<HomeBloc>();

    connectivity = injector.get<Connectivity>();
    connectivity.onConnectivityChanged.listen(
      (connectivityEvent) {
        if (connectivityEvent.contains(ConnectivityResult.ethernet) ||
            connectivityEvent.contains(ConnectivityResult.wifi) ||
            connectivityEvent.contains(ConnectivityResult.mobile)) {
          _homeBloc.add(UpdateTasksEvent());
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              'Интернет соединение установлено',
              style: TextStyle(color: Colors.black),
            ),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.white,
            content: Text(
              'Интернет соединение не установлено',
              style: TextStyle(color: Colors.black),
            ),
          ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _homeBloc,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F6F2),
        floatingActionButton: InkWell(
          onTap: () => context.router.push(TaskRoute()),
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
                _TodoList(
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
