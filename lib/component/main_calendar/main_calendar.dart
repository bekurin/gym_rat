import 'package:flutter/material.dart';
import 'package:gym_rat/component/main_calendar/event_loader.dart';
import 'package:gym_rat/component/main_calendar/marker_builder.dart';
import 'package:gym_rat/const/colors.dart';
import 'package:table_calendar/table_calendar.dart';

class MainCalendar extends StatelessWidget {
  final OnDaySelected onDaySelected;
  final DateTime selectedDate;

  const MainCalendar(
      {super.key, required this.onDaySelected, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      onDaySelected: onDaySelected,
      selectedDayPredicate: (date) =>
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,
      firstDay: DateTime(1800, 1, 1),
      lastDay: DateTime(3000, 1, 1),
      focusedDay: DateTime.now(),
      headerStyle: const HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.0),
      ),
      calendarBuilders: const CalendarBuilders(markerBuilder: markerBuilder),
      eventLoader: markerEventLoader,
      calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          defaultDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: LIGHT_GRAY_COLOR),
          weekendDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0),
              color: LIGHT_GRAY_COLOR),
          selectedDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(color: PRIMARY_COLOR, width: 1.0),
          ),
          defaultTextStyle:
              TextStyle(fontWeight: FontWeight.w600, color: DARK_GRAY_COLOR),
          weekendTextStyle:
              TextStyle(fontWeight: FontWeight.w600, color: DARK_GRAY_COLOR),
          selectedTextStyle:
              TextStyle(fontWeight: FontWeight.w600, color: PRIMARY_COLOR)),
    );
  }

  Widget _buildEventsMarker(DateTime date) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.0),
      width: 7.0,
      height: 7.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue,
      ),
    );
  }
}
