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
          color: const Color(0xFFF7F6F2),
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
        child: TextField(
          controller: textEditingController,
          minLines: 4,
          maxLines: 100,
          decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(16),
            border: InputBorder.none,
            hintText: 'Что надо сделать...',
            hintStyle: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.125,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ),
      ),
    );
  }
}
