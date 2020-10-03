
import 'package:dutchmenserve/Infrastructure/cubit/event_cubit.dart';
import 'package:dutchmenserve/Infrastructure/cubit/event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'EventsCalendar.dart';
import 'EventInfo.dart';
import 'homePage.dart';

// Opportunities Card with filter at top
class EventsList extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return BlocProvider(
      create: (context) => EventsCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Events- List View"),
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
              icon: Icon(Icons.date_range),
              onPressed: () {
                Navigator.push(
                  ctxt,
                  MaterialPageRoute(builder: (context) => EventsCalendar()),
                );
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: BlocBuilder<EventsCubit, EventsState>(
            builder: (context, state) {
              if (state is LoadedState) {
                return Column(
                  children: [
                    createEventCard(
                      ctxt,
                      'AFCA Warehouse',
                      'Date, Location',
                      'images\afca.JPG',
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                    ),
                    createEventCard(
                      ctxt,
                      'MissingMaps Mapathon',
                      'Date, Location',
                      'images\mapathon.jpg',
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                    ),
                    createEventCard(
                      ctxt,
                      'Compeer Virtual Buddy',
                      'Date, Location',
                      'images\compeer.png',
                      'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                    ),
                  ],
                );
              } else if (state is LoadingState) {}
            },
          ),
        ),
      ),
    );
  }
}

// function to create card for each event
GestureDetector createEventCard(BuildContext ctxt, String eventName,
    String eventSubtitle, String eventDescription, String imagePath) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        ctxt,
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
                onPressed: () {},
              ),
              title: Text(eventName),
              subtitle: Text(
                eventSubtitle,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            // Image.asset(imagePath),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                eventDescription,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                FlatButton(
                  textColor: Colors.indigoAccent,
                  onPressed: () {
                    // Perform some action
                  },
                  child: Text('REGISTER'),
                ),
                FlatButton(
                  textColor: Colors.indigoAccent,
                  onPressed: () {
                    // Perform some action
                  },
                  child: Text('FAVORITE'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {},
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
