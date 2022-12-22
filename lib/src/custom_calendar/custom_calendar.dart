import 'package:custom_date_picker/src/custom_calendar/preset.dart';
import 'package:custom_date_picker/src/utils/datetime_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomCalendar extends StatefulWidget {
  final Preset preset;
  final void Function(DateTime) onDateSelected;
  const CustomCalendar({
    Key? key,
    required this.preset,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  final DateTime _initialDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(_calenderDialogBorderRadius))),
      content: Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _getPresets(),
              _getCalendar(),
            ],
          ),
        ),
      ),
      actions: _getCalendarDialogActions(),
    );
  }

  Widget _getPresets() {
    switch (widget.preset) {
      case Preset.noPreset:
        return const SizedBox();
      case Preset.fourPresets:
        return Column(
          children: [
            _presetButtonsRow(
              AppLocalizations.of(context)!.neverEnds,
              AppLocalizations.of(context)!.fifteenDays,
              () {},
              () {
                setState(() {
                  _selectedDate = _initialDate.get15DaysLater();
                });
              },
            ),
            _presetButtonsRow(
              AppLocalizations.of(context)!.thirtyDays,
              AppLocalizations.of(context)!.sixtyDays,
              () {
                setState(() {
                  _selectedDate = _initialDate.get30DaysLater();
                });
              },
              () {
                setState(() {
                  _selectedDate = _initialDate.get60DaysLater();
                });
              },
            ),
          ],
        );
      case Preset.sixPresets:
        return Column(
          children: [
            _presetButtonsRow(
              AppLocalizations.of(context)!.yesterday,
              AppLocalizations.of(context)!.today,
              () {
                setState(() {
                  _selectedDate = _initialDate.getPreviousDay();
                });
              },
              () {
                setState(() {
                  _selectedDate = DateTime.now();
                });
              },
            ),
            _presetButtonsRow(
              AppLocalizations.of(context)!.tomorrow,
              AppLocalizations.of(context)!.thisSaturday,
              () {
                setState(() {
                  _selectedDate = _initialDate.getNextDay();
                });
              },
              () {
                setState(() {
                  _selectedDate = _initialDate.getThis(DateTime.saturday);
                });
              },
            ),
            _presetButtonsRow(
              AppLocalizations.of(context)!.thisSunday,
              AppLocalizations.of(context)!.nextTuesday,
              () {
                setState(() {
                  _selectedDate = _initialDate.getThis(DateTime.sunday);
                });
              },
              () {
                setState(() {
                  _selectedDate = _initialDate.getNext(DateTime.tuesday);
                });
              },
            ),
          ],
        );
    }
  }

  Widget _getCalendar() {
    return CalendarDatePicker(
      onDateChanged: (selectedDate) {
        setState(() {
          _selectedDate = selectedDate;
        });
      },
      initialDate: _selectedDate,
      firstDate: DateTime(_calendarStartYear),
      lastDate: DateTime(_calendarEndYear),
    );
  }

  Widget _presetButtonsRow(String presetText1, String presetText2,
      void Function() onTap1, void Function() onTap2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onTap1,
          child: Text(presetText1),
        ),
        TextButton(
          onPressed: onTap2,
          child: Text(presetText2),
        ),
      ],
    );
  }

  List<Widget> _getCalendarDialogActions() {
    return [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(AppLocalizations.of(context)!.cancel),
      ),
      TextButton(
        onPressed: () {
          widget.onDateSelected(_selectedDate);
          Navigator.of(context).pop();
        },
        child: Text(AppLocalizations.of(context)!.save),
      ),
    ];
  }
}

const double _calenderDialogBorderRadius = 10;
const int _calendarStartYear = 1900;
const int _calendarEndYear = 2200;
