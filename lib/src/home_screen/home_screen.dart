import 'package:custom_date_picker/src/custom_calendar/custom_calendar.dart';
import 'package:custom_date_picker/src/custom_calendar/preset.dart';
import 'package:custom_date_picker/src/utils/datetime_utils.dart';
import 'package:custom_date_picker/src/widgets/defaut_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? _withoutPresetDate;
  DateTime? _4PresetsDate;
  DateTime? _6PresetDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.calendarWidgets,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 30,
                ),
                DefaultButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext c) {
                        return CustomCalendar(
                          preset: Preset.noPreset,
                          onDateSelected: (selectedDate) {
                            setState(() {
                              _withoutPresetDate = selectedDate;
                            });
                          },
                        );
                      },
                    );
                  },
                  buttonText: AppLocalizations.of(context)!.withoutPreset,
                ),
                _withoutPresetDate != null
                    ? _getSelectedDateChip(
                        _withoutPresetDate!,
                        () {
                          setState(() {
                            _withoutPresetDate = null;
                          });
                        },
                      )
                    : const SizedBox(
                        height: _gapBetweenEachWidgetInColumn,
                      ),
                DefaultButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext c) {
                        return CustomCalendar(
                          preset: Preset.fourPresets,
                          onDateSelected: (selectedDate) {
                            setState(() {
                              _4PresetsDate = selectedDate;
                            });
                          },
                        );
                      },
                    );
                  },
                  buttonText: AppLocalizations.of(context)!.withFourPresets,
                ),
                _4PresetsDate != null
                    ? _getSelectedDateChip(
                        _4PresetsDate!,
                        () {
                          setState(() {
                            _4PresetsDate = null;
                          });
                        },
                      )
                    : const SizedBox(
                        height: _gapBetweenEachWidgetInColumn,
                      ),
                DefaultButton(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext c) {
                        return CustomCalendar(
                          preset: Preset.sixPresets,
                          onDateSelected: (selectedDate) {
                            setState(() {
                              _6PresetDate = selectedDate;
                            });
                          },
                        );
                      },
                    );
                  },
                  buttonText: AppLocalizations.of(context)!.withSixPresets,
                ),
                _6PresetDate != null
                    ? _getSelectedDateChip(
                        _6PresetDate!,
                        () {
                          setState(() {
                            _6PresetDate = null;
                          });
                        },
                      )
                    : const SizedBox(
                        height: _gapBetweenEachWidgetInColumn,
                      ),
                const SizedBox(
                  height: _gapBetweenEachWidgetInColumn,
                ),
                Text(AppLocalizations.of(context)!.fullName)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getSelectedDateChip(
    DateTime selectedDate,
    void Function() onDelete,
  ) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Chip(
          backgroundColor: Colors.blue.shade50,
          avatar: const Icon(
            Icons.calendar_today_outlined,
            size: 20,
            color: Colors.blue,
          ),
          label: Text(
            selectedDate.getFormattedDate(),
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
          onDeleted: onDelete,
          deleteIcon: const Icon(
            Icons.delete_outline_outlined,
            size: 20,
          ),
          deleteIconColor: Colors.blue,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

const double _gapBetweenEachWidgetInColumn = 75;
