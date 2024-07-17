part of '../home_screen.dart';

class _LandscapeHomeAppBar extends SliverPersistentHeaderDelegate {
  _LandscapeHomeAppBar({
    required this.showCompleted,
    required this.onVisibilityChanged,
  });

  final bool showCompleted;
  final void Function() onVisibilityChanged;

  double scrollAnimationValue(double shrinkOffset) {
    double maxScrollAllowed = maxExtent - minExtent;

    return ((maxScrollAllowed - shrinkOffset) / maxScrollAllowed).clamp(0, 1);
  }

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double visibleMainHeight = max(maxExtent - shrinkOffset, minExtent);
    final double animationVal = scrollAnimationValue(shrinkOffset);
    return Container(
      height: visibleMainHeight,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            color: Palette.shadowColor3.withOpacity(1 - animationVal),
            offset: const Offset(0, 1),
            blurRadius: 10,
          ),
          BoxShadow(
            color: Palette.shadowColor1.withOpacity(1 - animationVal),
            offset: const Offset(0, 4),
            blurRadius: 5,
          ),
          BoxShadow(
            color: Palette.shadowColor4.withOpacity(1 - animationVal),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: animationVal * 18,
            left: 60,
            child: Opacity(
              opacity: animationVal,
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return Text(
                    AppLocalizations.of(context)!
                        .completedTasks(state.doneTasks.length),
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      height: 1.25,
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            bottom: 16 + animationVal * 24,
            left: (animationVal * 44 + 16),
            child: Text(
              AppLocalizations.of(context)!.myTasks,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 32,
                height: 1.17,
              ),
            ),
          ),
          Positioned(
            bottom: 5 + animationVal * 2,
            right: 25,
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: InkWell(
                onTap: () => onVisibilityChanged(),
                child: Icon(
                  showCompleted
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 90;

  @override
  double get minExtent => 65;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
