import 'package:flutter/material.dart';

import 'reportGroupAddStudents.dart';
import 'ReportHoursPage.dart';

class NewReportIndividual extends StatelessWidget {
  int _value = 1;

  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Report'),
        backgroundColor: Colors.indigo[800],
      ),
      body: Center(
        child: NRIStateful(),
      ),
    );
  }
}

class NRIStateful extends StatefulWidget {
  NRIStateful({Key key}) : super(key: key);

  @override
  _NRIState createState() => _NRIState();
}

class _NRIState extends State<NRIStateful> {
  String _dropdownEvent;
  String _dropdownIG;
  DateTime _dateTime;

  // @override
  // void initState() {
  //   super.initState();
  //   _dropdownEvent = 'Event Name';
  //   _dropdownIG = 'Individual/Group Name';
  //   _dateTime = DateTime.now();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              RaisedButton(
                child: Text('Pick a Date'),
                onPressed: () {
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
              ),
              Text(_dateTime == null ? '' : _dateTime.toString())
            ],
          ),
          // TextField(
          //   decoration: InputDecoration(labelText: "Number of Hours"),
          //   keyboardType: TextInputType.number,
          //   inputFormatters: <TextInputFormatter>[
          //     FilteringTextInputFormatter.digitsOnly
          //   ],
          // ),
          ListTile(
            leading: Icon(Icons.timelapse),
            title: TextField(
              decoration: InputDecoration(
                hintText: "Number of Hours",
              ),
            ),
          ),
          DropdownButton<String>(
            value: _dropdownEvent,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                _dropdownEvent = newValue;
              });
            },
            items: <String>['One', 'Two', 'Free', 'Four']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            value: _dropdownIG,
            icon: Icon(Icons.arrow_downward),
            iconSize: 24,
            elevation: 16,
            style: TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String newValue) {
              setState(() {
                _dropdownIG = newValue;
              });
            },
            items: <String>['Individual', 'Womens Tennis', 'CAC', 'APO', 'AST']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          FlatButton(
            child: Text('Add students in group'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportAddStudents()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.add_a_photo),
            title: Text('Event Photo(s)'),
            subtitle: Text('None'), // temporary
            trailing: FlatButton(
              child: Text('Upload'),
              onPressed: () {},
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.add_a_photo),
          //   title: TextField(
          //     decoration: InputDecoration(
          //       hintText: "Add photo(s)",
          //     ),
          //   ),
          // ),
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
          )
        ],
      ),
    );
  }
}
