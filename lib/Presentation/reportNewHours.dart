// Page for reporting new hours
// TODO: Switch between reporting for individual or group

import 'package:dutchmenserve/Infrastructure/cubit/event_cubit.dart';
import 'package:dutchmenserve/Infrastructure/cubit/event_state.dart';
import 'package:dutchmenserve/Infrastructure/cubit/report_cubit.dart';
import 'package:dutchmenserve/Presentation/ReportGroupAddStudents.dart';
import 'package:dutchmenserve/Presentation/widgets.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/report.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ReportNewHours extends StatefulWidget {
  final User _user;
  ReportNewHours(this._user, {Key key}) : super(key: key);

  @override
  _RNHState createState() => _RNHState(_user);
}

class _RNHState extends State<ReportNewHours> {
  _RNHState(this._user);
  User _user;

  // data of report
  DateTime _dateTime;
  TextEditingController _hrsController = TextEditingController();
  double _hrs = 0;
  double _partialHour = 0;
  Event _event;
  List<DropdownMenuItem<Event>> _dropdownMenuItems;
  bool _showIndividual = false;
  TextEditingController _eventNameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  bool _isCommunity = false;

  @override
  Widget build(BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('New Report')),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<EventCubit>(
            create: (BuildContext context) => EventCubit(),
          ),
          BlocProvider<ReportCubit>(
            create: (BuildContext context) => ReportCubit(),
          ),
        ],
        child: GestureDetector(
          onTap: () {
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
          child: SingleChildScrollView(
            child: BlocBuilder<EventCubit, EventState>(
              builder: (context, state) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      createLTDate(),
                      createLTEvent(state),
                      createLTIndividual(currentFocus),
                      createLTHours(currentFocus),
                      createLTAddStudents(context),
                      createLTPhotos(),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 25),
                          child: NormalButton(
                            'Submit',
                            () {
                              // send report to repo
                              if (_showIndividual) {
                                _event = Event.individual(
                                  _eventNameController.text,
                                  _dateTime,
                                  _descriptionController.text,
                                  _isCommunity,
                                  id: 9, // made up id for now
                                );
                                // TODO: send new event first and get id
                              }
                              _hrs = (double.parse(_hrsController.text)) +
                                  _partialHour;
                              var b = context.watch<ReportCubit>();
                              b.submitReport(
                                  Report(_event, _hrs, _user), _user.id);
                              // TODO: alert to confirm submitting report
                              // Navigate back to report hours page
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  // below are methods for creating the List Tile widgets making up the report form
  ListTile createLTDate() {
    return ListTile(
      leading: Icon(Icons.insert_invitation),
      title: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          _dateTime == null ? 'Date' : DateFormat.yMd().format(_dateTime),
          style: TextStyle(
            color: _dateTime == null ? Colors.grey[600] : Colors.black,
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[500],
              width: 1.0,
            ),
          ),
        ),
      ),
      onTap: () {
        showDatePicker(
                context: context,
                initialDate: _dateTime == null ? DateTime.now() : _dateTime,
                firstDate: DateTime(DateTime.now().year),
                lastDate: DateTime(DateTime.now().year + 1))
            .then((date) {
          setState(() {
            _dateTime = date;
            _event = null;
          });
        });
      },
    );
  }

  List<DropdownMenuItem<Event>> buildDropDownMenuItems(
      List events, DateTime dt) {
    List<DropdownMenuItem<Event>> items = List();
    for (Event e in events) {
      if (e.dateCompare(dt) == 0) {
        items.add(
          DropdownMenuItem(
            child: Text(e.eventName),
            value: e,
          ),
        );
      }
    }
    items
        .add(DropdownMenuItem(child: Text('Individual'), value: Event.blank()));
    return items;
  }

  ListTile createLTEvent(EventState state) {
    if (state is LoadedState && _dateTime != null) {
      if (state.events.isEmpty) return blank('No events on this date');

      _dropdownMenuItems = buildDropDownMenuItems(state.events, _dateTime);
      return ListTile(
        title: DropdownButton<Event>(
          isExpanded: true,
          value: _event,
          onChanged: (Event newValue) {
            setState(() {
              _event = newValue;
              if (newValue == Event.blank())
                _showIndividual = true;
              else
                _showIndividual = false;
            });
          },
          items: _dropdownMenuItems,
        ),
      );
    }
    // else loading state or error state
    else {
      return blank('Select date first before selecting event');
    }
  }

  ListTile blank(String text) {
    return ListTile(
      title: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey[500],
              width: 1.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget createLTIndividual(FocusScopeNode currentFocus) {
    if (_showIndividual) {
      // ask for
      // set state: _event = Event.individual(values);
      return Column(
        children: [
          ListTile(
            title: TextField(
              controller: _eventNameController,
              decoration: InputDecoration(
                hintText: "Event Name",
                hintStyle: TextStyle(color: Colors.grey[600]),
                contentPadding: const EdgeInsets.only(bottom: 0, left: 10),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => currentFocus.unfocus(),
            ),
          ),
          ListTile(
            title: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                hintText: "Description",
                hintStyle: TextStyle(color: Colors.grey[600]),
                contentPadding: const EdgeInsets.only(bottom: 0, left: 10),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => currentFocus.unfocus(),
            ),
          ),
          ListTile(
            title: DropdownButton<bool>(
              isExpanded: true,
              value: _isCommunity,
              onChanged: (bool newValue) {
                setState(() {
                  _isCommunity = newValue;
                });
              },
              items:
                  <bool>[false, true].map<DropdownMenuItem<bool>>((bool value) {
                return DropdownMenuItem<bool>(
                  value: value,
                  child: Text(value ? 'Community' : 'Campus'),
                );
              }).toList(),
            ),
          ),
        ],
      );
    } else {
      return Row();
    }
  }

  ListTile createLTHours(FocusScopeNode currentFocus) {
    return ListTile(
      leading: Icon(Icons.timelapse),
      title: TextField(
        controller: _hrsController,
        decoration: InputDecoration(
          hintText: "Hours",
          hintStyle: TextStyle(color: Colors.grey[600]),
          contentPadding: const EdgeInsets.only(bottom: 0, left: 10),
        ),
        keyboardType: TextInputType.numberWithOptions(),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => currentFocus.unfocus(),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
        ),
        padding: const EdgeInsets.only(left: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<double>(
            value: _partialHour,
            onChanged: (double newValue) {
              setState(() {
                _partialHour = newValue;
              });
            },
            items: <double>[0, .25, .5, .75]
                .map<DropdownMenuItem<double>>((double value) {
              return DropdownMenuItem<double>(
                value: value,
                child: Text(value.toString()),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget createLTAddStudents(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: ListTile(
        leading: Icon(Icons.group_add),
        title: Text('Additional Students'),
        trailing: FlatButton(
          child: Text('Add'),
          color: Colors.grey[200],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ReportGroupAddStudents()),
            );
          },
        ),
        subtitle: Text('None'), // TODO: update students added
      ),
    );
  }

  ListTile createLTPhotos() {
    return ListTile(
      leading: Icon(Icons.add_a_photo),
      title: Text('Event Photo(s)'),
      subtitle: Text('None'), // TODO: update photos added
      trailing: FlatButton(
        color: Colors.grey[200],
        child: Text('Upload'),
        onPressed: () {
          //TODO: implement adding photos
        },
      ),
    );
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
