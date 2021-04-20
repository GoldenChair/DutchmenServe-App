import 'package:dutchmenserve/Infrastructure/cubit/event_cubit.dart';
import 'package:dutchmenserve/Infrastructure/cubit/event_state.dart';
import 'package:dutchmenserve/Presentation/EventInfo.dart';
import 'package:dutchmenserve/Presentation/EventsCalendar.dart';
import 'package:dutchmenserve/Presentation/widgets.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Opportunities Card with filter at top
// add interests to cards?
// build out event info page
// link up registration to cubit
class EventsList extends StatefulWidget {
  final User user;
  EventsList({Key key, this.user}) : super(key: key);
  @override
  EventsListState createState() => EventsListState(user);
}

class EventsListState extends State<EventsList> {
  User user;
  EventsListState(this.user);

  final List<String> filterLabels = ['Registered', 'Ongoing', 'Upcoming'];
  List<bool> selected = [false, false, true]; // default upcoming

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
            selected = [false, false, false];
            selected[index] = newValue;
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

  Widget createEventCard(BuildContext context, Event e) {
    // 0 registered, 1 ongoing, 2 upcoming
    if (selected.every((element) => element == false) ||
        (selected[0] && e.registered.contains(user.id)) ||
        (selected[1] && e.isOngoing) ||
        (selected[2] && (e.dateCompare(DateTime.now()) >= 0))) {
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
                  child: e.imagepath == null
                      ? Container()
                      : Image(image: AssetImage(e.imagepath)),
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
                      icon: e.registered.contains(user.id)
                          ? Icon(Icons.pan_tool, size: 30)
                          : Icon(Icons.pan_tool_outlined, size: 30),
                      color: Colors.blueGrey[700], //Color(0xff206090),
                      onPressed: () {
                        if (e.registered.contains(user.id)) {
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
                              // send request to delete registration
                              BlocProvider.of<EventCubit>(context)
                                  .unregisterUser(user, e);
                              // setState(() {
                              //   user.unregister(e);
                              // });
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
                              // send request to post registration
                              BlocProvider.of<EventCubit>(context)
                                  .registerUser(user, e);
                              // setState(() {
                              //   user.register(e);
                              // });
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
    } else
      return Row();
  }

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
    return BlocConsumer<EventCubit, EventState>(
      listener: (context, state) {
        if (state is RegistrationFailedState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  "Registration did not go through-- please refresh and try again."),
            ),
          );
        } else if (state is RegistrationSuccessState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("You are registered!"),
            ),
          );
        } else if (state is UnregisterFailedState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content:
                  Text("Deregistration failed-- please refresh and try again."),
            ),
          );
        } else if (state is UnregisterSuccessState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text("You are no longer registered!"),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadedState) {
          final evlist = state.events;
          evlist.sort((a, b) => a.date.compareTo(b.date));

          return CustomScrollView(
            slivers: [
              // showCalendarView(context);
              SliverPadding(
                padding: const EdgeInsets.only(top: 20),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: generateChips(),
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                    (context, index) => createEventCard(context, evlist[index]),
                    childCount: evlist.length),
              ),
            ],
          );
        } else if (state is ErrorState) {
          return Center(
            child: Icon(Icons.close),
          );
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
          return Container();
        }
      },
    );
  }
}
