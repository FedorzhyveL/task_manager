import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/data/models/todo_task_model.dart';

part 'widgets/text_field.dart';
part 'widgets/date_picker.dart';
part 'widgets/delete_module.dart';
part 'widgets/priority_selection.dart';

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

  @override
  void initState() {
    super.initState();
    if (widget.todoTask != null) {
      textEditingController.value = TextEditingValue(text: widget.todoTask!.taskInfo);
      dropdownValue = widget.todoTask!.taskPriority.toString();
      switchValue = widget.todoTask!.taskDeadline != null;
      taskDeadline = widget.todoTask!.taskDeadline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF7F6F2),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(
            Icons.close_rounded,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'СОХРАНИТЬ',
              style: TextStyle(
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
      body: ListView(
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
          _DeleteModule(isEditMode: widget.todoTask == null),
        ],
      ),
    );
  }
}
