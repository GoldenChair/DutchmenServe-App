import 'package:dutchmenserve/Infrastructure/cubit/event_cubit.dart';
import 'package:dutchmenserve/Infrastructure/cubit/event_state.dart';
import 'package:dutchmenserve/Presentation/EventsList.dart';
import 'package:dutchmenserve/Presentation/EventsOngoing.dart';
import 'package:dutchmenserve/Presentation/homePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class EventsCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events- Calendar View'),
        backgroundColor: Colors.indigo[800],
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              ctxt,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                ctxt,
                MaterialPageRoute(builder: (context) => EventsList()),
              );
            },
          )
        ],
      ),
      body: BlocProvider<EventCubit>(
        create: (context) => EventCubit(),
        child: Column(
          children: [
            OppsCalendarStateful(),
            RaisedButton(
              child: Text('See Ongoing Events'),
              onPressed: () {
                Navigator.push(
                  ctxt,
                  MaterialPageRoute(builder: (context) => EventsOngoing()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OppsCalendarStateful extends StatefulWidget {
  OppsCalendarStateful({Key key}) : super(key: key);

  @override
  _OCalState createState() => _OCalState();
}

class _OCalState extends State<OppsCalendarStateful> {
  CalendarController _calendarController;

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      builder: (context, state) {
        return TableCalendar(
          calendarController: _calendarController,
        );
      },
    );
  }
}
