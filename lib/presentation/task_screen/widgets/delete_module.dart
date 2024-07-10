part of '../task_screen.dart';

class _DeleteModule extends StatelessWidget {
  const _DeleteModule({
    this.isEditMode = false,
    required this.onDelete,
  });
  final bool isEditMode;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          InkWell(
            onTap: onDelete,
            child: Icon(
              Icons.delete_rounded,
              color: isEditMode ? Colors.black.withOpacity(0.15) : const Color.fromRGBO(255, 59, 48, 1),
            ),
          ),
          const SizedBox(width: 20),
          Text(
            AppLocalizations.of(context)!.delete,
            style: TextStyle(
              color: isEditMode ? Colors.black.withOpacity(0.15) : const Color.fromRGBO(255, 59, 48, 1),
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}
