part of '../task_screen.dart';

class _TodoTaskTextField extends StatelessWidget {
  const _TodoTaskTextField({required this.textEditingController});
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
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
        child: TextField(
          controller: textEditingController,
          minLines: 4,
          maxLines: 100,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(16),
            border: InputBorder.none,
            hintText: 'Что надо сделать...',
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.125,
              color: context.isDarkMode
                  ? DarkPalette.labelTertiary
                  : LightPalette.labelTertiary,
            ),
          ),
        ),
      ),
    );
  }
}
