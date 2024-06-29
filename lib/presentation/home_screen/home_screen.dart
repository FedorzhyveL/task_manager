import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/data/models/todo_task_model.dart';
import 'package:task_manager/main.dart';
import 'package:task_manager/presentation/task_screen/task_screen.dart';

part 'widgets/todo_item.dart';
part 'widgets/todo_list.dart';
part 'widgets/app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<TodoTaskModel> tasks;
  bool showCompleted = false;
  bool isAppBarOverscrolled = false;
  final _scrollController = ScrollController();
  bool showStaticAppBar = false;

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
    tasks = [
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        done: true,
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то, где-то, зачем-то, но зачем не очень понятно',
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то, где-то, зачем-то, но зачем не очень понятно, но точно чтобы показать как обрезается…',
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskPriority: TodoTaskPriority.high,
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskPriority: TodoTaskPriority.low,
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 1),
        taskPriority: TodoTaskPriority.high,
        done: true,
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 2),
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 3),
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 2),
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 3),
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 2),
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 3),
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 2),
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 3),
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 2),
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 3),
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 4),
        done: true,
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 5),
        done: true,
      ),
      TodoTaskModel(
        taskInfo: 'Купить что-то',
        taskDeadline: DateTime(2024, 7, 6),
        done: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      floatingActionButton: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const TaskScreen(),
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
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          _HomeAppBar(
            doneTasksAmount: tasks.where((element) => element.done).length,
            showCompleted: showCompleted,
            onVisibilityChanged: () => setState(
              () {
                showCompleted = !showCompleted;
              },
            ),
            showStaticAppBar: showStaticAppBar,
          ),
          // SliverAppBar.large(
          //   scrolledUnderElevation: 0,
          //   title: Padding(
          //     padding: const EdgeInsets.only(left: 48, bottom: 16),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         const Text(
          //           'Мои дела',
          //           style: TextStyle(
          //             fontWeight: FontWeight.w500,
          //             fontSize: 32,
          //             color: Colors.black,
          //             height: 1.17,
          //           ),
          //         ),
          //         if (!isAppBarOverscrolled)
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Text(
          //                 'Выполненно — ${tasks.where((element) => element.done).length}',
          //                 style: const TextStyle(
          //                   fontWeight: FontWeight.w400,
          //                   fontSize: 16,
          //                   color: Color.fromRGBO(0, 0, 0, 0.3),
          //                   height: 1.25,
          //                 ),
          //               ),
          //               Padding(
          //                 padding: const EdgeInsets.only(right: 16),
          //                 child: InkWell(
          //                   onTap: () => setState(() {
          //                     showCompleted = !showCompleted;
          //                   }),
          //                   child: Icon(
          //                     showCompleted ? Icons.visibility_off_rounded : Icons.visibility_rounded,
          //                     size: 24,
          //                     color: const Color.fromRGBO(0, 122, 255, 1),
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //       ],
          //     ),
          //   ),
          //   onStretchTrigger: () => Future(() {
          //     setState(() {
          //       isAppBarOverscrolled = !isAppBarOverscrolled;
          //     });
          //   }),
          //   backgroundColor: const Color(0xFFF7F6F2),
          // ),
          _TodoList(
            tasks: tasks,
            showCompleted: showCompleted,
          ),
        ],
      ),
    );
  }
}
