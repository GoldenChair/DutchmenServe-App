import 'package:dutchmenserve/Infrastructure/cubit/event_cubit.dart';
import 'package:dutchmenserve/Infrastructure/cubit/event_state.dart';
import 'package:dutchmenserve/Presentation/EventInfo.dart';
import 'package:dutchmenserve/Presentation/EventsCalendar.dart';
import 'package:dutchmenserve/Presentation/widgets.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/interest.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<Interest> interests = [
  Interest('Animals', id: 1),
  Interest('Disabilities', id: 2),
  Interest('Education', id: 3),
  Interest('Food', id: 4),
  Interest('Health\nWellness', id: 5),
  Interest('Housing', id: 6),
  Interest('Older Adults', id: 7),
  Interest('Service Trips', id: 8),
  Interest('Veterans', id: 9),
  Interest('Other', id: 10),
];

List<IconData> icons = [
  Icons.pets,
  Icons.accessible,
  Icons.school,
  Icons.local_restaurant,
  Icons.healing,
  Icons.home,
  Icons.face,
  Icons.explore,
  Icons.stars,
  Icons.more_horiz,
];

// index colors by interest id
List<Color> colors = [
  Colors.pink[600],
  Colors.blueAccent[200],
  Colors.orangeAccent[700],
  Colors.lime,
  Colors.redAccent,
  Colors.greenAccent[700],
  Colors.deepPurple[400],
  Colors.teal[600],
  Colors.purple[600],
  Colors.blueGrey[600],
];

List<Color> fillColors = [
  Colors.pink[100], //Color(0xfffccde5),
  Colors.blue[100], //Color(0xff80b1d3),
  Colors.orange[100], //Color(0xffffffb3),
  Colors.lime[100], //Color(0xfffdb462),
  Colors.red[100], //Color(0xfffb8072),
  Colors.green[100], //Color(0xffb3de69),
  Colors.deepPurple[100], //Color(0xffbebada),
  Colors.teal[100], //Color(0xff8dd3c7),
  Colors.purple[100], //Color(0xffbc80bd),
  Colors.blueGrey[100], //Color(0xffd9d9d9),
];

List<Event> evlist = [
  Event('AFCA Warehouse', DateTime.parse('2020-12-08T12:00:00Z'), 'Lebanon',
      'pack medical supplies', <int>[5], true,
      id: 1, imagepath: 'images/afca.JPG'),
  Event(
      'Mapathon',
      DateTime.parse('2021-04-05T12:00:00Z'),
      'LVC',
      'Log online to help fill in gaps in maps and other things make this a long description blah blah hello hi idk what to type but this will be long as an example',
      <int>[5],
      true,
      id: 2,
      imagepath: 'images/mapathon.jpg'),
  Event(
      'Compeer Virtual Buddy Lets make this a really long title',
      DateTime.parse('2021-03-08T12:00:00Z'),
      'LVC',
      'Spend time with Compeer buddy!',
      <int>[5],
      true,
      id: 3,
      imagepath: 'images/compeer.png'),
  Event(
      'AFCA Warehouse',
      DateTime.parse('2020-12-08T12:00:00Z'),
      'Lebanon and around the corner just making this really long as an example',
      'pack medical supplies',
      <int>[5],
      true,
      id: 4,
      imagepath: 'images/afca.JPG'),
  Event('Mapathon', DateTime.parse('2021-04-05T12:00:00Z'), 'LVC',
      'Log online to help fill in gaps in maps', <int>[5], true,
      id: 5, imagepath: 'images/mapathon.jpg', isOngoing: true),
  Event('Compeer Virtual Buddy', DateTime.parse('2021-03-08T12:00:00Z'), 'LVC',
      'Spend time with Compeer buddy', <int>[5], true,
      id: 6, imagepath: 'images/compeer.png'),
  Event('AFCA Warehouse', DateTime.parse('2020-12-08T12:00:00Z'), 'Lebanon',
      'pack medical supplies', <int>[5], true,
      id: 7, imagepath: 'images/afca.JPG'),
  Event('Mapathon', DateTime.parse('2021-04-05T12:00:00Z'), 'LVC',
      'Log online to help fill in gaps in maps', <int>[5], true,
      id: 8, imagepath: 'images/mapathon.jpg', isOngoing: true),
  Event('Compeer Virtual Buddy', DateTime.parse('2021-03-08T12:00:00Z'), 'LVC',
      'Spend time with Compeer buddy', <int>[5], true,
      id: 9, imagepath: 'images/compeer.png'),
  Event('AFCA Warehouse', DateTime.parse('2020-12-08T12:00:00Z'), 'Lebanon',
      'pack medical supplies', <int>[5], true,
      id: 10, imagepath: 'images/afca.JPG'),
  Event('Mapathon', DateTime.parse('2021-04-05T12:00:00Z'), 'LVC',
      'Log online to help fill in gaps in maps', <int>[5], true,
      id: 12, imagepath: 'images/mapathon.jpg'),
  Event('Compeer Virtual Buddy', DateTime.parse('2021-03-08T12:00:00Z'), 'LVC',
      'Spend time with Compeer buddy', <int>[5], true,
      id: 13, imagepath: 'images/compeer.png'),
];

// Opportunities Card with filter at top
class EventsList extends StatefulWidget {
  User user;
  EventsList({Key key, this.user}) : super(key: key);
  bool isSelected = false;
  @override
  EventsListState createState() => EventsListState(user);
}

class EventsListState extends State<EventsList> {
  User user;
  EventsListState(this.user);

  final List<String> filterLabels = ['Registered', 'Ongoing', 'Upcoming'];
  List<bool> selected =
      List.generate(3, (index) => false); // default filters off
  Set<Event> eventSet = Set();
  List<Event> showEvents = evlist; // default start with full list

  void doFilter(int index, bool newSelect) {
    if (newSelect) {
      // add events
      switch (filterLabels[index]) {
        case 'Registered':
          {
            for (Event e in evlist) {
              if (user.isRegistered(e)) eventSet.add(e);
            }
          }
          break;

        case 'Ongoing':
          {
            for (Event e in evlist) {
              if (e.isOngoing) eventSet.add(e);
            }
          }
          break;

        case 'Upcoming':
          {
            for (Event e in evlist) {
              if (e.dateCompare(DateTime.now()) >= 0) eventSet.add(e);
            }
          }
          break;
      }
    } else {
      // remove events
      switch (filterLabels[index]) {
        case 'Registered':
          {
            for (Event e in evlist) {
              if (user.isRegistered(e)) eventSet.remove(e);
            }
          }
          break;

        case 'Ongoing':
          {
            for (Event e in evlist) {
              if (e.isOngoing) eventSet.remove(e);
            }
          }
          break;

        case 'Upcoming':
          {
            for (Event e in evlist) {
              if (e.dateCompare(DateTime.now()) >= 0) eventSet.remove(e);
            }
          }
          break;
      }
    }
  }

  Widget generateChip(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: FilterChip(
        label: Text(
          filterLabels[index],
          style: TextStyle(fontSize: 15),
        ),
        labelStyle:
            TextStyle(color: selected[index] ? Colors.black : Colors.grey[600]),
        selected: selected[index],
        onSelected: (bool newValue) {
          setState(() {
            selected[index] = newValue;
            if (selected.every((element) => false) ||
                selected.every((element) => true)) {
              showEvents = evlist;
            } else {
              doFilter(index, newValue);
              showEvents = eventSet.toList();
            }
          });
        },
        backgroundColor: Colors.grey[300],
        selectedColor: const Color(0xffFFE400),
        showCheckmark: false,
        elevation: selected[index] ? 0 : 3,
      ),
    );
  }

  List<Widget> generateChips() {
    return List.generate(filterLabels.length, (index) => generateChip(index));
  }

  GestureDetector createEventCard(BuildContext context, Event e) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventInfo(e)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Card(
          elevation: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 2),
                  child: Text(
                    e.eventName,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Image(image: AssetImage(e.imagepath)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 15, right: 5),
                child: Text(
                  e.description,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: IconButton(
                    icon: user.isRegistered(e)
                        ? Icon(Icons.pan_tool, size: 30)
                        : Icon(Icons.pan_tool_outlined, size: 30),
                    color: Colors.blueGrey[700], //Color(0xff206090),
                    onPressed: () {
                      if (user.isRegistered(e)) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogBox(
                                title: 'Are you sure?',
                                buttonLeft: 'Cancel',
                                buttonRight: 'Unregister',
                                description: '',
                                showCheckbox: false,
                                child: Icon(Icons.error,
                                    size: 70, color: const Color(0xffA02A2C)),
                              );
                            }).then((valueFromDialog) {
                          if (valueFromDialog == null) return;
                          if (valueFromDialog) {
                            setState(() {
                              user.unregister(e);
                            });
                          }
                        });
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogBox(
                                title: 'Almost there!',
                                buttonLeft: 'Cancel',
                                buttonRight: 'Register',
                                showCheckbox: true,
                                description:
                                    'I confirm I will be at this event on time and if I need to change my registration, I will at least 24 hours in advance.',
                                child: Icon(Icons.error,
                                    size: 70, color: const Color(0xffA02A2C)),
                              );
                            }).then((valueFromDialog) {
                          if (valueFromDialog == null) return;
                          if (valueFromDialog) {
                            setState(() {
                              user.register(e);
                            });
                          }
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //unused interest bubbles-- add to event card
  final List<Widget> interests = List.generate(
    10,
    (i) => Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: colors[i],
      ),
      padding: const EdgeInsets.all(5),
      child: Icon(
        icons[i],
        color: Colors.white,
        size: 15,
      ),
    ),
  );

  Widget showCalendarView(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 20),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                child: Text('Calendar View'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EventsCalendar(user)),
                  );
                })
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> chips = generateChips();
    showEvents.sort((a, b) => a.date.compareTo(b.date));
    return CustomScrollView(
      slivers: [
        // showCalendarView(context);
        SliverPadding(
          padding: const EdgeInsets.only(top: 20),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: chips,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
              (context, index) => createEventCard(context, showEvents[index]),
              childCount: showEvents.length),
        ),
      ],
    );

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

          // testing without bloc
          // body: CustomScrollView(
          //   slivers: [
          //     SliverGrid(
          //       gridDelegate:
          //           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          //       delegate:
          //           SliverChildBuilderDelegate((BuildContext context, int index) {
          //         return generateChip(index);
          //       }, childCount: 3),
          //     ),
          //     SliverPadding(
          //       padding: const EdgeInsets.symmetric(vertical: 10),
          //       sliver: SliverList(
          //         delegate: SliverChildBuilderDelegate(
          //             (context, index) => createEventCard(context, evlist[index]),
          //             childCount: evlist.length),
          //       ),
          //     ),
          //   ],
          // ),

          // with bloc builder
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
}
