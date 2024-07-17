import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'package:task_manager/core/di.dart';
import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/presentation/home_screen/bloc/home_bloc.dart';
import 'package:task_manager/presentation/navigation/app_router.dart';
import 'package:task_manager/presentation/utils/palette.dart';
import 'package:task_manager/utils/extensions/color_extension.dart';
import 'package:task_manager/utils/extensions/context_extension.dart';

part 'widgets/app_bar.dart';
part 'widgets/landscape_app_bar.dart';
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
    injector.get<FirebaseAnalytics>().logEvent(name: 'home_page_opened');

    _scrollController.addListener(() {
      if (_scrollController.offset >= (15 + kToolbarHeight) &&
          showStaticAppBar == false) {
        setState(() {
          showStaticAppBar = true;
        });
      } else if (_scrollController.offset < (15 + kToolbarHeight) &&
          showStaticAppBar == true) {
        setState(() {
          showStaticAppBar = false;
        });
      }
    });

    _homeBloc = context.read<HomeBloc>();

    connectivity = injector.get<Connectivity>();
    connectivity.onConnectivityChanged.listen(
      (connectivityEvent) {
        final hasConnection =
            connectivityEvent.contains(ConnectivityResult.ethernet) ||
                connectivityEvent.contains(ConnectivityResult.wifi) ||
                connectivityEvent.contains(ConnectivityResult.mobile);
        final message = hasConnection
            ? 'Интернет соединение установлено'
            : 'Интернет соединение не установлено';
        if (hasConnection) _homeBloc.add(UpdateTasksEvent());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Text(
              message,
              style: TextStyle(
                color: context.isDarkMode
                    ? DarkPalette.labelPrimary
                    : LightPalette.labelPrimary,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => _homeBloc,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.router.push(TaskRoute()),
          child: const Icon(
            Icons.add_rounded,
            size: 24,
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SafeArea(
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  if (MediaQuery.orientationOf(context) ==
                      Orientation.landscape)
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _LandscapeHomeAppBar(
                        showCompleted: showCompleted,
                        onVisibilityChanged: () => setState(
                          () {
                            showCompleted = !showCompleted;
                          },
                        ),
                      ),
                    ),
                  if (MediaQuery.orientationOf(context) == Orientation.portrait)
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _HomeAppBar(
                        showCompleted: showCompleted,
                        onVisibilityChanged: () => setState(
                          () {
                            showCompleted = !showCompleted;
                          },
                        ),
                      ),
                    ),
                  _TodoList(
                    showCompleted: showCompleted,
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 16),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
