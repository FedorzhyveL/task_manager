part of '../home_screen.dart';

class _ToDoListItem extends StatelessWidget {
  const _ToDoListItem(this.todoTask);
  final TodoTaskModel todoTask;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        padding: const EdgeInsets.only(left: 20),
        color: context.isDarkMode ? DarkPalette.green : LightPalette.green,
        alignment: Alignment.centerLeft,
        child: const Icon(
          Icons.check_rounded,
          color: LightPalette.white,
        ),
      ),
      secondaryBackground: Container(
        padding: const EdgeInsets.only(right: 20),
        color: context.isDarkMode ? DarkPalette.red : LightPalette.red,
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete_rounded,
          color: LightPalette.white,
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          context.read<HomeBloc>().add(
                EditTaskEvent(
                  task: todoTask.copyWith(done: !todoTask.done),
                ),
              );
          logger.i('task completed');
        } else if (direction == DismissDirection.endToStart) {
          context.read<HomeBloc>().add(
                DeleteTaskEvent(
                  task: todoTask.copyWith(done: !todoTask.done),
                ),
              );
          logger.i('task deleted');
        }
      },
      child: Container(
        color: Theme.of(context).cardColor,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CheckBox(todoTask),
            const SizedBox(width: 14),
            _TodoItemInfo(todoTask),
            const SizedBox(width: 14),
            _TodoInfoButton(todoTask),
          ],
        ),
      ),
    );
  }
}

class _CheckBox extends StatelessWidget {
  const _CheckBox(this.todoTask);

  final TodoTaskModel todoTask;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Checkbox(
        side: BorderSide(
          width: 2,
          color: todoTask.importance == Importance.important
              ? context.isDarkMode
                  ? DarkPalette.red
                  : LightPalette.red
              : context.isDarkMode
                  ? DarkPalette.supportSeparator
                  : LightPalette.supportSeparator,
        ),
        value: todoTask.done,
        onChanged: (value) {
          context.read<HomeBloc>().add(
                EditTaskEvent(
                  task: todoTask.copyWith(done: value),
                ),
              );
        },
      ),
    );
  }
}

class _TodoItemInfo extends StatelessWidget {
  _TodoItemInfo(this.todoTask);
  final TodoTaskModel todoTask;

  final remoteConfigColor = injector.get<FirebaseRemoteConfig>().getString(
        'major_importance_color',
      );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.25,
                color: context.isDarkMode
                    ? DarkPalette.labelPrimary
                    : LightPalette.labelPrimary,
              ),
              children: [
                if (todoTask.importance == Importance.important)
                  WidgetSpan(
                    child: Icon(
                      Icons.priority_high_rounded,
                      color: remoteConfigColor.isEmpty
                          ? context.isDarkMode
                              ? DarkPalette.red
                              : LightPalette.red
                          : ColorExtension.fromHex(
                              remoteConfigColor,
                            ),
                    ),
                  ),
                if (todoTask.importance == Importance.basic)
                  WidgetSpan(
                    child: Icon(
                      Icons.arrow_downward_rounded,
                      color: context.isDarkMode
                          ? DarkPalette.gray
                          : LightPalette.gray,
                    ),
                  ),
                TextSpan(
                  text: todoTask.text,
                  style: TextStyle(
                    decoration:
                        todoTask.done ? TextDecoration.lineThrough : null,
                  ),
                ),
              ],
            ),
          ),
          if (todoTask.deadline != null)
            Text(
              DateFormat('d MMMM yyyy').format(todoTask.deadline!),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.42,
              ),
            ),
        ],
      ),
    );
  }
}

class _TodoInfoButton extends StatelessWidget {
  const _TodoInfoButton(this.todoTask);
  final TodoTaskModel todoTask;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.router.push(TaskRoute(todoTask: todoTask)),
      child: Icon(
        Icons.info_outline_rounded,
        color: context.isDarkMode
            ? DarkPalette.labelTertiary
            : LightPalette.labelTertiary,
      ),
    );
  }
}
