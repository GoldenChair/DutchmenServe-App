import 'package:dutchmenserve/Infrastructure/cubit/event_cubit.dart';
import 'package:dutchmenserve/Infrastructure/cubit/event_state.dart';
import 'package:dutchmenserve/Presentation/EventInfo.dart';
import 'package:dutchmenserve/Presentation/EventsCalendar.dart';
import 'package:dutchmenserve/Presentation/homePage.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Opportunities Card with filter at top
class EventsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Events- List View"),
          backgroundColor: Colors.indigo[800],
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.date_range),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventsCalendar()),
                );
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<EventCubit, EventState>(
            builder: (context, state) {
              if (state is LoadedState) {
                return Column(
                    children: state.events
                        .map((e) => createEventCard(context, e))
                        .toList());
              } else if (state is LoadingState) {
                return Dialog(
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new CircularProgressIndicator(),
                      new Text("Loading"),
                    ],
                  ),
                );
              } else {
                return Dialog(
                  child: new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new CircularProgressIndicator(),
                      new Text("Loading"),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

// function to create card for each event
  GestureDetector createEventCard(BuildContext context, Event e) {
    Color _iconColor = Colors.white;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventInfo()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(25),
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                  icon: Icon(Icons.pan_tool),
                  color: _iconColor,
                  onPressed: () {
                    //TODO: implement register for event
                  },
                ),
                title: Text(e.eventName),
                subtitle: Text(
                  e.date + ' | ' + e.location,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              // Image.asset(imagePath),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  e.description,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          //TODO: implement favoriting event
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {
                          //TODO: implement sharing
                        },
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
