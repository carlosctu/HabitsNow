import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/colors.dart';
import '../../home_page.dart';
import '../events.dart';

class BodyCalendarPage extends StatefulWidget {
  const BodyCalendarPage({Key? key}) : super(key: key);
  static String diaFocado = _BodyCalendarPageState.diaFocado;

  @override
  State<BodyCalendarPage> createState() => _BodyCalendarPageState();
}

class _BodyCalendarPageState extends State<BodyCalendarPage> {
  final ValueNotifier<List<Event>> _selectedEvents = ValueNotifier([]);
  static String diaFocado = "";
  

  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  DateTime _focusedDay = DateTime.now();


  @override
void initState() {
    _BodyCalendarPageState.diaFocado = "HOJE";
    super.initState();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForDays(Set<DateTime> days) {
    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(
      () {
        _focusedDay = focusedDay;
        if (_selectedDays.contains(selectedDay)) {
          _selectedDays.remove(selectedDay);
        } else {
          _selectedDays.add(selectedDay);
        }
        _BodyCalendarPageState.diaFocado = "${selectedDay.day}/${selectedDay.month}/${selectedDay.year}";
      },
    );

    _selectedEvents.value = _getEventsForDays(_selectedDays);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<Event>(
          calendarStyle: const CalendarStyle(
            holidayTextStyle: TextStyle(
              color: AppColors.iconDisablePage,
            ),
            weekendTextStyle: TextStyle(
              color: AppColors.iconDisablePage,
            ),
            defaultTextStyle: TextStyle(
              color: AppColors.iconDisablePage,
            ),
            todayTextStyle: TextStyle(
              color: AppColors.iconDisablePage,
            ),
            selectedTextStyle: TextStyle(
              color: AppColors.topBar,
            ),
            selectedDecoration:
                BoxDecoration(color: AppColors.title, shape: BoxShape.circle),
            todayDecoration:
                BoxDecoration(color: AppColors.backgroundPage, shape: BoxShape.circle),
          ),
          firstDay: kFirstDay,
          lastDay: kLastDay,
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.week,
          eventLoader: _getEventsForDay,
          startingDayOfWeek: StartingDayOfWeek.monday,
          selectedDayPredicate: (day) {
            return _selectedDays.contains(day);
          },
          onDaySelected: _onDaySelected,
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(AppColors.title)),
          child: const Text('Clear selection'),
          onPressed: () {
            setState(
              () {
                _selectedDays.clear();
                _selectedEvents.value = [];
              },
            );
          },
        ),
        const SizedBox(height: 8.0),
        Expanded(
          child: ValueListenableBuilder<List<Event>>(
            valueListenable: _selectedEvents,
            builder: (context, value, _) {
              return ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12.0),
                      color: AppColors.iconDisablePage,
                    ),
                    child: ListTile(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const HomePage(), // Adicionar caminho para a Pag. Tarefas ou Hábitos
                        ),
                      ),
                      title: Text(
                        '${value[index]}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
