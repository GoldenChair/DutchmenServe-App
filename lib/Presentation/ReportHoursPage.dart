// General page for reporting hours
// shows user summary view of community service history
// FAB brings user to report new hours, either for individual or group

//TODO: fix FAB to show plus
//TODO: implement summary view

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'reportNewHours.dart';

class ReportHoursPage extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      // backgroundColor: Colors.indigo[800],
      appBar: AppBar(title: Text('Service Hours')),
      body: SafeArea(
        child: Column(
          children: [
            Center(
                child: Text(
              'Summary',
              textAlign: TextAlign.center,
            )),
            Card(
              color: Colors.indigo,
              elevation: 5,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.indigo[800],
      //   onPressed: () {
      //     Navigator.push(
      //       ctxt,
      //       MaterialPageRoute(builder: (context) => NewReport()),
      //     );
      //   },
      //   tooltip: 'Report Hours',
      //   child: Icon(Icons.add),
      // ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.person),
            backgroundColor: Colors.indigoAccent[100],
            label: 'Individual',
            onTap: () {
              Navigator.push(
                ctxt,
                MaterialPageRoute(builder: (context) => ReportNewHours()),
              );
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.group),
            backgroundColor: Colors.indigoAccent[200],
            label: 'Group',
            onTap: () {
              Navigator.push(
                ctxt,
                MaterialPageRoute(builder: (context) => ReportNewHours()),
              );
            },
          ),
        ],
      ),
    );
  }
}
