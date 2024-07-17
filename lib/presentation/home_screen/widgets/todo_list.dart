part of '../home_screen.dart';

class _TodoList extends StatelessWidget {
  const _TodoList({required this.showCompleted});
  final bool showCompleted;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: injector.isReady<FirebaseRemoteConfig>(),
      builder: (context, snapshot) {
        return SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: context.isLaptop ? 200 : 8),
          sliver: DecoratedSliver(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 2,
                  color: Palette.shadowColor1,
                ),
                BoxShadow(
                  blurRadius: 2,
                  color: Palette.shadowColor2,
                ),
              ],
            ),
            sliver: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final tasks = snapshot.hasData
                    ? showCompleted
                        ? state.doneTasks
                        : state.tasks
                    : [];
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
                          ),
                        ),
                      );
                    } else {
                      if (!showCompleted && tasks[index].done) {
                        return const SizedBox();
                      }
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
      },
    );
  }
}
