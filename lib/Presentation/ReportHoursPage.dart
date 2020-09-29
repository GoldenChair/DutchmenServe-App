// General page for reporting hours
// shows user summary view of community service history
// FAB brings user to report new hours, either for individual or group

//TODO: fix FAB to show plus
//TODO: implement summary view

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'ReportNewHours.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'homePage.dart';

class ReportHoursPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.indigo[800],
      appBar: AppBar(
          title: Text('Service Hours'),
          leading: BackButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          )),
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
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Semester To Date:',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 1,
                  ),
                  AutoSizeText(
                    '30',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                    maxLines: 1,
                  ),
                ],
              ),
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
      //       context,
      //       MaterialPageRoute(builder: (context) => ReportNewReport()),
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
                context,
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
                context,
                MaterialPageRoute(builder: (context) => ReportNewHours()),
              );
            },
          ),
        ],
      ),
    );
  }
}
