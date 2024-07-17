part of '../task_screen.dart';

class _TodoDatePicker extends StatelessWidget {
  const _TodoDatePicker({
    this.taskDeadline,
    required this.switchValue,
    required this.onDateSelected,
    required this.onDateRemoved,
  });
  final DateTime? taskDeadline;
  final bool switchValue;
  final void Function(DateTime datePickerValue, bool switchValue)
      onDateSelected;
  final void Function(bool switchValue) onDateRemoved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.chooseDeadline,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  height: 1.17,
                ),
              ),
              if (taskDeadline != null)
                Text(
                  DateFormat('d MMMM yyyy').format(taskDeadline!),
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    height: 1.17,
                  ),
                ),
            ],
          ),
          SizedBox(
            width: 36,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Switch(
                value: switchValue,
                onChanged: (value) async {
                  switch (value) {
                    case true:
                      await showDatePicker(
                        initialDate: DateTime.now(),
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        currentDate: DateTime.now(),
                        barrierLabel: 'Выберите день',
                        context: context,
                        firstDate: DateTime.now().copyWith(
                          hour: 0,
                          minute: 0,
                          second: 0,
                          microsecond: 0,
                          millisecond: 0,
                        ),
                        lastDate: DateTime.now()
                            .add(
                              const Duration(
                                days: 365,
                              ),
                            )
                            .copyWith(
                              hour: 0,
                              minute: 0,
                              second: 0,
                              microsecond: 0,
                              millisecond: 0,
                            ),
                      ).then((datePickerValue) {
                        if (datePickerValue != null) {
                          onDateSelected(
                            datePickerValue,
                            value,
                          );
                        }
                      });
                    case false:
                      onDateRemoved(value);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
