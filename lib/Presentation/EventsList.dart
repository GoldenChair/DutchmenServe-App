import 'package:dutchmenserve/Infrastructure/cubit/event_cubit.dart';
import 'package:dutchmenserve/Infrastructure/cubit/event_state.dart';
import 'package:dutchmenserve/Presentation/EventInfo.dart';
import 'package:dutchmenserve/Presentation/EventsCalendar.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<Event> evlist = [
  Event('AFCA Warehouse', DateTime.parse('2020-12-08T12:00:00Z'), 'Lebanon',
      'pack medical supplies', <int>[5], true,
      id: 1, imagepath: 'images/afca.JPG'),
  Event('Mapathon', DateTime.parse('2021-04-05T12:00:00Z'), 'LVC',
      'Log online to help fill in gaps in maps', <int>[5], true,
      id: 2, imagepath: 'images/mapathon.jpg'),
  Event('Compeer Virtual Buddy', DateTime.parse('2021-03-08T12:00:00Z'), 'LVC',
      'Spend time with Compeer buddy', <int>[5], true,
      id: 3, imagepath: 'images/compeer.png'),
];

// Opportunities Card with filter at top
class EventsList extends StatefulWidget {
  final User user;
  EventsList({Key key, this.user}) : super(key: key);
  bool isSelected = false;
  @override
  EventsListState createState() => EventsListState(user);
}

class EventsListState extends State<EventsList> {
  User user;
  EventsListState(this.user);

  final List<String> labels = ['Registered', 'Ongoing', 'Upcoming'];
  List<bool> selected = List.generate(3, (index) => false);

  List<Widget> generateChips() {
    return List.generate(
      labels.length,
      (index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: FilterChip(
          label: Text(
            labels[index],
            style: TextStyle(fontSize: 15),
          ),
          labelStyle:
              TextStyle(color: selected[index] ? Colors.black : Colors.white),
          selected: selected[index],
          onSelected: (bool newValue) {
            setState(() {
              selected[index] = newValue;
            });
          },
          backgroundColor: Colors.grey[350],
          selectedColor: Color(0xffFFE400),
          showCheckmark: false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> chips = generateChips();
    return BlocProvider(
      create: (context) => EventCubit(),
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Color(0xffFFE400),
        //   child: Icon(
        //     Icons.date_range,
        //     color: Colors.black,
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(builder: (context) => EventsCalendar(user)),
        //     );
        //   },
        // ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: chips,
                ),
                Column(
                    children: evlist //state.events
                        .map((e) => createEventCard(context, e))
                        .toList()),
              ],
            ),
          ),
        ),
        // body: SingleChildScrollView(
        //   child: BlocBuilder<EventCubit, EventState>(
        //     builder: (context, state) {
        //       if (state is LoadedState) {
        //         return Column(
        //             children: evlist //state.events
        //                 .map((e) => createEventCard(context, e))
        //                 .toList());
        //       } else {
        //         return Dialog(
        //           child: new Row(
        //             mainAxisSize: MainAxisSize.min,
        //             children: [
        //               new CircularProgressIndicator(),
        //               new Text("Loading"),
        //             ],
        //           ),
        //         );
        //       }
        //     },
        //   ),
        // ),
      ),
    );
  }

  // function to create card for each event
  GestureDetector createEventCard(BuildContext context, Event e) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventInfo(e)),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              ListTile(
                // leading: IconButton(
                //   icon: Icon(Icons.pan_tool),
                //   // color: _iconColor,
                //   onPressed: () {
                //     //TODO: implement register for event
                //   },
                // ),
                title: Container(
                  margin: EdgeInsets.only(top: 10, bottom: 2),
                  child: Text(
                    e.eventName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Text(
                  e.dateString() + '\n' + e.location,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Image(image: AssetImage(e.imagepath)),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  e.description,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
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
