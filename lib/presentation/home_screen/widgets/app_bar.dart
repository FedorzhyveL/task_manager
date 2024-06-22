part of '../home_screen.dart';

class _HomeAppBar extends StatelessWidget {
  const _HomeAppBar({
    required this.doneTasksAmount,
    required this.showCompleted,
    required this.onVisibilityChanged,
    required this.showStaticAppBar,
  });

  final int doneTasksAmount;
  final bool showCompleted;
  final void Function() onVisibilityChanged;
  final bool showStaticAppBar;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      expandedHeight: 200,
      scrolledUnderElevation: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: Container(
        padding: EdgeInsets.only(left: showStaticAppBar ? 16 : 48, bottom: 16),
        decoration: showStaticAppBar
            ? const BoxDecoration(
                color: Color.fromRGBO(247, 246, 242, 1),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                    offset: Offset(0, 1),
                    blurRadius: 10,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.12),
                    offset: Offset(0, 4),
                    blurRadius: 5,
                  ),
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.14),
                    offset: Offset(0, 2),
                    blurRadius: 5,
                  ),
                ],
              )
            : null,
        child: showStaticAppBar
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Мои дела',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      color: Colors.black,
                      height: 1.17,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: InkWell(
                      onTap: () => onVisibilityChanged(),
                      child: Icon(
                        showCompleted ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                        size: 24,
                        color: const Color.fromRGBO(0, 122, 255, 1),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Мои дела',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      color: Colors.black,
                      height: 1.17,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Выполненно — $doneTasksAmount',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color.fromRGBO(0, 0, 0, 0.3),
                          height: 1.25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: InkWell(
                          onTap: () => onVisibilityChanged(),
                          child: Icon(
                            showCompleted ? Icons.visibility_off_rounded : Icons.visibility_rounded,
                            size: 24,
                            color: const Color.fromRGBO(0, 122, 255, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
      backgroundColor: const Color(0xFFF7F6F2),
    );
  }
}
