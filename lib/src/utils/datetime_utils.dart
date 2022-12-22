import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime getThis(int day) {
    return add(
      Duration(
        days: (day - weekday) % DateTime.daysPerWeek,
      ),
    );
  }

  DateTime getNext(int day) {
    return add(
      Duration(
        days: (day - weekday) % 14,
      ),
    );
  }

  DateTime getPreviousDay() => DateTime(year, month, day - 1);

  DateTime getNextDay() => DateTime(year, month, day + 1);

  DateTime get15DaysLater() => DateTime(year, month, day + 15);

  DateTime get30DaysLater() => DateTime(year, month, day + 30);

  DateTime get60DaysLater() => DateTime(year, month, day + 60);

  String getFormattedDate() {
    final format = DateFormat("d MMM y");
    return format.format(this);
  }
}
