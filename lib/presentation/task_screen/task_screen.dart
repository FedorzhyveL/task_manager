import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

import 'package:task_manager/domain/models/todo_task_model.dart';
import 'package:task_manager/presentation/home_screen/bloc/home_bloc.dart';
import 'package:task_manager/presentation/navigation/app_router.dart';

part 'widgets/date_picker.dart';
part 'widgets/delete_module.dart';
part 'widgets/priority_selection.dart';
part 'widgets/text_field.dart';

@RoutePage()
class TaskScreen extends StatefulWidget {
  const TaskScreen({
    super.key,
    this.todoTask,
  });
  final TodoTaskModel? todoTask;
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  String dropdownValue = 'Нет';
  bool switchValue = false;
  DateTime? taskDeadline;
  final textEditingController = TextEditingController.fromValue(
    const TextEditingValue(text: ''),
  );

  late final HomeBloc homeBloc;

  @override
  void initState() {
    super.initState();
    if (widget.todoTask != null) {
      textEditingController.value = TextEditingValue(text: widget.todoTask!.text);
      dropdownValue = widget.todoTask!.importance.toString();
      switchValue = widget.todoTask!.deadline != null;
      taskDeadline = widget.todoTask!.deadline;
    }
    homeBloc = context.read<HomeBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F6F2),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            if (context.router.canPop()) {
              context.router.maybePop();
            } else {
              context.router.replace(const HomeRoute());
            }
          },
          icon: const Icon(
            Icons.close_rounded,
          ),
        ),
        actions: [
          TextButton(
            onPressed: widget.todoTask == null
                ? () {
                    homeBloc.add(
                      CreateTaskEvent(
                        text: textEditingController.text,
                        importance: Importance.fromString(dropdownValue),
                        deadline: taskDeadline,
                      ),
                    );
                  }
                : () {
                    homeBloc.add(
                      EditTaskEvent(
                        task: widget.todoTask!.copyWith(
                          text: textEditingController.text,
                          importance: Importance.fromString(dropdownValue),
                          deadline: taskDeadline,
                          changeDeadline: true,
                        ),
                      ),
                    );
                  },
            child: Text(
              AppLocalizations.of(context)!.saveTask,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.71,
                letterSpacing: 0.16,
                color: Color(0xff007aff),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      body: BlocConsumer(
        bloc: homeBloc,
        listener: (context, state) {
          if (context.router.canPop()) {
            context.router.maybePop();
          } else {
            context.router.replace(const HomeRoute());
          }
        },
        builder: (context, state) => ListView(
          children: [
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TodoTaskTextField(
                  textEditingController: textEditingController,
                ),
                const SizedBox(height: 12),
                _PrioritySelection(
                  dropdownValue: dropdownValue,
                  onChanged: (value) => setState(
                    () {
                      dropdownValue = value;
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Divider(
                  height: 0.5,
                  indent: 16,
                  endIndent: 16,
                  color: Colors.black.withOpacity(0.2),
                ),
                const SizedBox(height: 16),
                _TodoDatePicker(
                  taskDeadline: taskDeadline,
                  switchValue: switchValue,
                  onDateSelected: (datePickerValue, value) => setState(
                    () {
                      taskDeadline = datePickerValue;
                      switchValue = value;
                    },
                  ),
                  onDateRemoved: (value) => setState(
                    () {
                      taskDeadline = null;
                      switchValue = value;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Divider(
              indent: 0,
              height: 0.5,
              color: Colors.black.withOpacity(0.2),
            ),
            const SizedBox(height: 16),
            _DeleteModule(
              isEditMode: widget.todoTask == null,
              onDelete: widget.todoTask != null
                  ? () => homeBloc.add(
                        DeleteTaskEvent(task: widget.todoTask!),
                      )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
