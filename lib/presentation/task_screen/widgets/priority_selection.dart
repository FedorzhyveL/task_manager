part of '../task_screen.dart';

class _PrioritySelection extends StatelessWidget {
  const _PrioritySelection({
    required this.dropdownValue,
    required this.onChanged,
  });

  final String dropdownValue;
  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const Text(
            'Важность',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.17,
            ),
          ),
          DropdownButton(
            isDense: true,
            iconSize: 0,
            value: dropdownValue,
            underline: const SizedBox(),
            elevation: 0,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              height: 1.172,
              color: Colors.black.withOpacity(0.3),
            ),
            selectedItemBuilder: (context) {
              return [
                const Text('Нет'),
                const Text('Низкий'),
                const Text('!! Высокий'),
              ];
            },
            dropdownColor: Colors.white,
            onChanged: (value) {
              if (value != null) {
                onChanged(value);
              }
            },
            items: const [
              DropdownMenuItem(
                value: 'Нет',
                child: Text(
                  'Нет',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1,
                    color: Colors.black,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: 'Низкий',
                child: Text(
                  'Низкий',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1,
                    color: Colors.black,
                  ),
                ),
              ),
              DropdownMenuItem(
                value: '!! Высокий',
                child: Text(
                  '!! Высокий',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    height: 1,
                    color: Color.fromARGB(255, 255, 59, 48),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
