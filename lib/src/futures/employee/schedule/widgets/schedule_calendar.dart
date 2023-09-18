// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dw_barbershop/src/core/ui/helpers/messages.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:dw_barbershop/src/core/ui/constants.dart';

class ScheduleCalendar extends StatefulWidget {
  final VoidCallback cancelPressed;
  final ValueChanged<DateTime> okPressed;
  const ScheduleCalendar({
    Key? key,
    required this.cancelPressed,
    required this.okPressed,
  }) : super(key: key);

  @override
  State<ScheduleCalendar> createState() => _ScheduleCalendarState();
}

class _ScheduleCalendarState extends State<ScheduleCalendar> {
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xffe6e2e9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          TableCalendar(
            availableGestures: AvailableGestures.none,
            headerStyle: const HeaderStyle(titleCentered: true),
            focusedDay: DateTime.now(),
            firstDay: DateTime.utc(2019, 01, 01),
            lastDay: DateTime.now().add(const Duration(days: 365 * 10)),
            calendarFormat: CalendarFormat.month,
            locale: 'pt_BR',
            availableCalendarFormats: const {
              CalendarFormat.month: 'Month',
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                this.selectedDay = selectedDay;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: const BoxDecoration(
                color: ColorsConstants.brow,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: ColorsConstants.brow.withOpacity(0.4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: widget.cancelPressed,
                child: const Text(
                  'Cancelar',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorsConstants.brow,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  if (selectedDay == null) {
                    Messages.showError('Por favor selecione um dia', context);
                  }
                  widget.okPressed(selectedDay!);
                },
                child: const Text(
                  'Ok',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorsConstants.brow,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
