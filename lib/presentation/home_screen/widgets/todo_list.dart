part of '../home_screen.dart';

class _TodoList extends StatelessWidget {
  const _TodoList({required this.showCompleted});
  final bool showCompleted;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      sliver: DecoratedSliver(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 2,
              color: Colors.black.withOpacity(0.12),
            ),
            BoxShadow(
              blurRadius: 2,
              color: Colors.black.withOpacity(0.06),
            ),
          ],
        ),
        sliver: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final tasks = showCompleted ? state.doneTasks : state.tasks;
            return SliverList.builder(
              itemCount: tasks.length + 1,
              itemBuilder: (context, index) {
                if (index == tasks.length) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 54,
                      right: 16,
                      top: 12,
                      bottom: 12,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.newTask,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        height: 1.25,
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                      ),
                    ),
                  );
                } else {
                  if (!showCompleted && tasks[index].done) return const SizedBox();
                  return _ToDoListItem(
                    tasks[index],
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
