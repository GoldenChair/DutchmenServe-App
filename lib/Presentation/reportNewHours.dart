// Page for reporting new hours
// TODO: Switch between reporting for individual or group

import 'package:dutchmenserve/models/event.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'ReportGroupAddStudents.dart';
import 'ReportHoursPage.dart';

class ReportNewHours extends StatelessWidget {
  int _value = 1;

  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Report'),
        backgroundColor: Colors.indigo[800],
      ),
      body: RNHStateful(),
    );
  }
}

class RNHStateful extends StatefulWidget {
  RNHStateful({Key key}) : super(key: key);

  @override
  _RNHState createState() => _RNHState();
}

class _RNHState extends State<RNHStateful> {
  double _partialHour = 0;
  Event _event;
  String _dropdownEvent;
  String _dropdownIG;
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          createLTDate(),
          createLTEvent(),
          createLTHours(),
          createLTAddStudents(context),
          createLTPhotos(),
          Center(
            child: RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportHoursPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  ListTile createLTDate() {
    return ListTile(
      leading: Icon(Icons.insert_invitation),
      title: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(vertical: 8.0),
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
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime(2022))
            .then((date) {
          setState(() {
            _dateTime = date;
          });
        });
      },
    );
  }

  ListTile createLTEvent() {
    return ListTile(
      title: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          _event == null ? 'Event' : _event.eventName,
          style: TextStyle(
            color: _event == null ? Colors.grey[600] : Colors.black,
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
        //TODO: show event options based on date
      },
    );
  }

  ListTile createLTHours() {
    return ListTile(
      leading: Icon(Icons.timelapse),
      title: TextField(
        decoration: InputDecoration(
          hintText: "Hours",
        ),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
      trailing: DropdownButton<double>(
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
    );
  }

  ListTile createLTAddStudents(BuildContext context) {
    return ListTile(
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
