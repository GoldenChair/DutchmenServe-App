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
        child: ListView(
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: LinearPercentIndicator(
                  leading: Icon(
                    Icons.gavel,
                    size: 40,
                  ),
                  progressColor: Colors.black,
                  percent: 0.07,
                  animation: true,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  lineHeight: 25.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: LinearPercentIndicator(
                  leading: Icon(
                    Icons.pets,
                    size: 40,
                  ),
                  progressColor: Colors.yellow[700],
                  percent: 0.05,
                  animation: true,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  lineHeight: 25.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: LinearPercentIndicator(
                  leading: Icon(
                    Icons.color_lens,
                    size: 40,
                  ),
                  progressColor: Colors.blue[700],
                  percent: 0.02,
                  animation: true,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  lineHeight: 25.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: LinearPercentIndicator(
                  leading: Icon(
                    Icons.child_care,
                    size: 40,
                  ),
                  progressColor: Colors.green,
                  percent: 0.07,
                  animation: true,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  lineHeight: 25.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: LinearPercentIndicator(
                  leading: Icon(
                    Icons.group,
                    size: 40,
                  ),
                  progressColor: Colors.pink,
                  percent: 0.28,
                  animation: true,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  lineHeight: 25.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: LinearPercentIndicator(
                  leading: Icon(
                    Icons.computer,
                    size: 40,
                  ),
                  progressColor: Colors.grey,
                  percent: 0.15,
                  animation: true,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  lineHeight: 25.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: LinearPercentIndicator(
                  leading: Icon(
                    Icons.school,
                    size: 40,
                  ),
                  progressColor: Colors.blue[700],
                  percent: 0.12,
                  animation: true,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  lineHeight: 25.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: LinearPercentIndicator(
                  leading: Icon(
                    Icons.face,
                    size: 40,
                  ),
                  progressColor: Colors.blue[700],
                  percent: 0.02,
                  animation: true,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  lineHeight: 25.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: LinearPercentIndicator(
                  leading: Icon(
                    Icons.more_horiz,
                    size: 40,
                  ),
                  progressColor: Colors.blue[700],
                  percent: 0.22,
                  animation: true,
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  lineHeight: 25.0,
                ),
              ),
            ),
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
