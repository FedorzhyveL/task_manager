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
        color: const Color.fromRGBO(52, 199, 80, 1),
        alignment: Alignment.centerLeft,
        child: const Icon(
          Icons.check_rounded,
          color: Colors.white,
        ),
      ),
      secondaryBackground: Container(
        padding: const EdgeInsets.only(right: 20),
        color: const Color.fromRGBO(255, 59, 48, 1),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete_rounded,
          color: Colors.white,
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
      child: Padding(
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
        fillColor: todoTask.importance == Importance.important
            ? WidgetStateProperty.resolveWith(
                (states) => states.contains(WidgetState.selected)
                    ? const Color.fromRGBO(244, 67, 54, 1)
                    : const Color.fromRGBO(244, 67, 54, 0.16),
              )
            : WidgetStateProperty.resolveWith(
                (states) => states.contains(WidgetState.selected) ? const Color.fromRGBO(52, 199, 89, 1) : null,
              ),
        side: BorderSide(
          width: 2,
          color: todoTask.importance == Importance.important ? Colors.red : const Color.fromRGBO(0, 0, 0, 0.2),
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
  const _TodoItemInfo(this.todoTask);
  final TodoTaskModel todoTask;

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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 1.25,
                color: Colors.black,
              ),
              children: [
                if (todoTask.importance == Importance.important)
                  const WidgetSpan(
                    child: Icon(
                      Icons.priority_high_rounded,
                      color: Color.fromRGBO(255, 59, 48, 1),
                    ),
                  ),
                if (todoTask.importance == Importance.basic)
                  const WidgetSpan(
                    child: Icon(
                      Icons.arrow_downward_rounded,
                      color: Color.fromRGBO(142, 142, 147, 1),
                    ),
                  ),
                TextSpan(
                  text: todoTask.text,
                  style: TextStyle(decoration: todoTask.done ? TextDecoration.lineThrough : null),
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
                color: Color.fromRGBO(0, 0, 0, 0.3),
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
        color: Colors.black.withOpacity(0.3),
      ),
    );
  }
}
