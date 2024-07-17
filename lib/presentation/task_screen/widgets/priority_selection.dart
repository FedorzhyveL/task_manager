part of '../task_screen.dart';

class _PrioritySelection extends StatelessWidget {
  _PrioritySelection({
    required this.dropdownValue,
    required this.onChanged,
  });

  final String dropdownValue;
  final Function(String value) onChanged;

  final remoteConfigColor = injector.get<FirebaseRemoteConfig>().getString(
        'major_importance_color',
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.priority,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              height: 1.17,
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton(
              isDense: true,
              iconSize: 0,
              value: dropdownValue,
              elevation: 0,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                height: 1.172,
                color: context.isDarkMode
                    ? DarkPalette.labelTertiary
                    : LightPalette.labelTertiary,
              ),
              selectedItemBuilder: (context) {
                return [
                  Text(AppLocalizations.of(context)!.lowPriority),
                  Text(AppLocalizations.of(context)!.basicPriority),
                  Text(AppLocalizations.of(context)!.importantPriority),
                ];
              },
              dropdownColor: context.isDarkMode
                  ? DarkPalette.backElevated
                  : LightPalette.backElevated,
              onChanged: (value) {
                if (value != null) {
                  onChanged(value);
                }
              },
              items: [
                DropdownMenuItem(
                  value: 'Нет',
                  child: Text(
                    AppLocalizations.of(context)!.lowPriority,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1,
                      color: context.isDarkMode
                          ? DarkPalette.labelPrimary
                          : LightPalette.labelPrimary,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: 'Низкий',
                  child: Text(
                    AppLocalizations.of(context)!.basicPriority,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1,
                      color: context.isDarkMode
                          ? DarkPalette.labelPrimary
                          : LightPalette.labelPrimary,
                    ),
                  ),
                ),
                DropdownMenuItem(
                  value: AppLocalizations.of(context)!.importantPriority,
                  child: Text(
                    '!! Высокий',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1,
                      color: remoteConfigColor.isEmpty
                          ? context.isDarkMode
                              ? DarkPalette.red
                              : LightPalette.red
                          : ColorExtension.fromHex(
                              remoteConfigColor,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
