import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'ReportIndividual.dart';
import 'package:percent_indicator/percent_indicator.dart';

// TO DO: Pages to implement
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
            CircularPercentIndicator(
              progressColor: Colors.blue[700],
              percent: 0.72,
              animation: true,
              radius: 250.0,
              lineWidth: 15.0,
              circularStrokeCap: CircularStrokeCap.round,
              center: Text('Next Goal'),
            ),
            SizedBox(
              height: 20,
            ),
            LinearPercentIndicator(
              progressColor: Colors.red[800],
              percent: 0.33,
              lineHeight: 25.0,
              center: Text('Next Goal'),
            )
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
                MaterialPageRoute(builder: (context) => ReportIndividual()),
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
                MaterialPageRoute(builder: (context) => ReportIndividual()),
              );
            },
          ),
        ],
      ),
    );
  }
}
