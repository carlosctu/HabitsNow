import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../core/colors.dart';
import '../../widgets/custom_top_bar.dart';
import '../sidebar/navigation_drawer.dart';
import 'events.dart';

class CalendarPage extends StatefulWidget {
  CalendarPage({Key? key, this.callback}) : super(key: key);
  final String diaFocado = CalendarPageState.diaFocado;
  final CalendarFormat formato = CalendarPageState.formato;
  final Function? callback;

  @override
  State<CalendarPage> createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  static String diaFocado = "";
  static CalendarFormat formato = CalendarFormat.week;
  Color corIconeAgenda = AppColors.iconDisablePage;
  int contButtonAgenda = 0;
  static DateTime? diaSelecionado = DateTime.now();

  final ValueNotifier<List<Event>> selectedEvents = ValueNotifier([]);

  final Set<DateTime> selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    hashCode: getHashCode,
  );

  DateTime _focusedDay = DateTime.now();

  @override
  void dispose() {
    selectedEvents.dispose();
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
        if (selectedDays.contains(selectedDay)) {
          selectedDays.remove(selectedDay);
        } else {
          selectedDays.add(selectedDay);
        }
        CalendarPageState.diaSelecionado = selectedDay;
        CalendarPageState
                .diaFocado = //DateFormat('EEEEE',"pt_BR").format(selectedDay);
            "${selectedDay.day} de ${DateFormat('MMMM', "pt_BR").format(selectedDay)} de ${selectedDay.year}";
      },
    );

    selectedEvents.value = _getEventsForDays(selectedDays);
  }

  @override
  void initState() {
    diaFocado = "Hoje";
    initializeDateFormatting();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: CustomTopBar(
        title: diaFocado,
        simbol: IconButton(
          onPressed: () {
            setState(() {
              contButtonAgenda++;
              if (contButtonAgenda % 2 != 0) {
                corIconeAgenda = AppColors.iconActivePage;
                formato = CalendarFormat.month;
              } else {
                corIconeAgenda = AppColors.iconDisablePage;
                formato = CalendarFormat.week;
              }
            });
          },
          icon: Icon(
            Icons.calendar_today_outlined,
            color: corIconeAgenda,
          ),
        ),
      ),
      // backgroundColor: AppColors.backgroundPage,
      drawer: const NavigationDrawer(),
      // bottomNavigationBar: const CustomBottomBar(),
      body: Column(
        children: [
          TableCalendar<Event>(
            calendarStyle: const CalendarStyle(
              holidayTextStyle: TextStyle(
                color: AppColors.iconDisablePage,
              ),
              weekendTextStyle: TextStyle(
                color: AppColors.iconActivePage,
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
              outsideTextStyle: TextStyle(
                color: Color.fromARGB(255, 36, 36, 36),
              ),
              selectedDecoration:
                  BoxDecoration(color: AppColors.title, shape: BoxShape.circle),
              todayDecoration: BoxDecoration(
                  color: AppColors.backgroundPage, shape: BoxShape.circle),
            ),
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: formato,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.sunday,
            selectedDayPredicate: (day) {
              return selectedDays.contains(day);
            },
            onDaySelected: _onDaySelected,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(
            height: 25,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.title)),
            child: const Text('Limpar e atualizar'),
            onPressed: () {
              setState(
                () {
                  selectedDays.clear();
                  selectedEvents.value = [];
                  CalendarPageState.diaFocado = "Hoje";
                },
              );
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: selectedEvents,
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
                        onTap: () {
                          widget.callback!();
                        },
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: AppColors.iconActivePage,
      //   child: Icon(Icons.add),
      //   onPressed: () => print('Fui clicado'),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
