// General page for reporting hours
// shows user summary view of community service history
// FAB brings user to report new hours

import 'package:dutchmenserve/Presentation/reportNewHours.dart';
import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/interest.dart';
import 'package:dutchmenserve/models/report.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart' as gauges;

class _PieData {
  _PieData(this.xData, this.yData, [this.text, this.color]);
  final String xData;
  final num yData;
  final String text;
  final Color color;
}

// does this really need to be stateful?????? no, change to stateless once bloc hooked up
class ReportHoursPage extends StatefulWidget {
  User user;
  ReportHoursPage(this.user, {Key key}) : super(key: key);

  @override
  _ReportHoursState createState() => _ReportHoursState(user);
}

class _ReportHoursState extends State<ReportHoursPage> {
  User user;
  _ReportHoursState(this.user);

  final List<Interest> interests = [
    Interest('Animals'),
    Interest('Disabilities'),
    Interest('Education'),
    Interest('Food'),
    Interest('Health and Wellness'),
    Interest('Housing'),
    Interest('Older Adults'),
    Interest('Service Trips'),
    Interest('Veterans'),
    Interest('Other'),
  ];
  final List<IconData> icons = [
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
  final List<Color> colors = [
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
  final List<Color> fillColors = [
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

  final List<Color> camCom = [
    const Color(0xffCCCCFF),
    const Color(0xff8D9EFA),
  ];

  final List<Report> all = [
    Report.fromID(2, .5, 1),
    Report.fromID(1, 3, 1),
    Report.fromID(3, 1, 2),
    Report.fromID(4, 1, 1),
    Report.fromID(5, .5, 1),
    Report.fromID(6, 1, 1),
    Report.fromID(7, .5, 2),
    Report.fromID(8, 3, 1),
    Report.fromID(9, .5, 1),
    Report.fromID(10, 1, 1),
  ];

  int index = 0;
  bool isComm = false;
  Event getRandEvent(int eid) {
    if (index == 10) index = 0;
    index++;
    isComm = !isComm;
    return Event(
      'Poverty Simulation Training',
      DateTime.now(),
      'Virtual',
      'Train to be facilitator for virtual Poverty Simulation',
      [index, index + 1],
      isComm,
      id: eid,
    );
  }

  // show breakdown by interest
  Widget interestDonut(List<double> counts) {
    List<_PieData> pieData = List<_PieData>.filled(10, null, growable: false);
    for (int i = 1; i < 11; i++) {
      pieData[i - 1] = _PieData(
        interests[i - 1].interest,
        counts[i],
        (counts[i] / counts[11] * 100).round().toString() + '%',
        colors[i - 1].withOpacity(0),
      );
    }
    return SfCircularChart(
      margin: const EdgeInsets.all(0),
      tooltipBehavior: TooltipBehavior(
        tooltipPosition: TooltipPosition.pointer,
        enable: true,
        format: 'point.x point.y',
        duration: 1750,
      ),
      series: <DoughnutSeries<_PieData, String>>[
        DoughnutSeries<_PieData, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '0%',
          innerRadius: '90%',
          dataSource: pieData,
          xValueMapper: (_PieData data, _) => data.xData,
          yValueMapper: (_PieData data, _) => data.yData,
          dataLabelMapper: (_PieData data, _) => data.text,
          pointColorMapper: (_PieData data, _) => data.color,
          dataLabelSettings: DataLabelSettings(
            isVisible: false,
            showZeroValue: false,
          ),
        ),
      ],
    );
  }

  // show breakdown by community/campus
  Widget serviceTypeDonut(List<double> counts) {
    List<_PieData> data = [
      _PieData(
        'Campus',
        counts[12],
        (counts[12] / counts[0]).round().toString() + '%',
        camCom[0],
      ),
      _PieData(
        'Community',
        counts[13],
        (counts[13] / counts[0]).round().toString() + '%',
        camCom[1],
      )
    ];
    // or red: 0xffA02A2C
    return SfCircularChart(
      margin: const EdgeInsets.all(0),
      tooltipBehavior: TooltipBehavior(
        tooltipPosition: TooltipPosition.pointer,
        enable: true,
        format: 'point.x point.y',
        duration: 1750,
      ),
      series: <DoughnutSeries<_PieData, String>>[
        DoughnutSeries<_PieData, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '0%',
          innerRadius: '90%',
          dataSource: data,
          xValueMapper: (_PieData data, _) => data.xData,
          yValueMapper: (_PieData data, _) => data.yData,
          dataLabelMapper: (_PieData data, _) => data.text,
          pointColorMapper: (_PieData data, _) => data.color,
          dataLabelSettings: DataLabelSettings(
            isVisible: false,
            showZeroValue: false,
          ),
        ),
      ],
    );
  }

  // show progress till Gold Award
  // Gold: 100+ hours of community service AND at least one residential service project
  // or 250+ hours of community service
  // Silver:
  // Bronze:
  Widget radialBar(List<double> counts) {
    // double progress = counts[13];
    double progress = 130.75;
    if (counts[14] > 0) progress += 150;

    String value = progress.toString();
    if (progress % 1 == 0) value = progress.toStringAsFixed(0);

    return gauges.SfRadialGauge(
      axes: <gauges.RadialAxis>[
        gauges.RadialAxis(
          minimum: 0,
          maximum: 250,
          showLabels: false,
          showTicks: false,
          axisLineStyle: gauges.AxisLineStyle(
            thickness: 0.15,
            cornerStyle: gauges.CornerStyle.bothCurve,
            color: Color.fromARGB(30, 0, 169, 181),
            thicknessUnit: gauges.GaugeSizeUnit.factor,
          ),
          pointers: <gauges.GaugePointer>[
            gauges.RangePointer(
              value: progress,
              width: 0.05,
              pointerOffset: .05,
              sizeUnit: gauges.GaugeSizeUnit.factor,
              cornerStyle: gauges.CornerStyle.startCurve,
              gradient: SweepGradient(colors: <Color>[
                const Color(0xFF00a9b5),
                const Color(0xFFa4edeb)
              ], stops: <double>[
                0.25,
                0.75
              ]),
            ),
            gauges.MarkerPointer(
              value: progress,
              markerType: gauges.MarkerType.diamond,
              color: const Color(0xFF87e8e8),
            )
          ],
          annotations: <gauges.GaugeAnnotation>[
            gauges.GaugeAnnotation(
              positionFactor: 0.1,
              angle: 90,
              widget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'T O T A L',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    value,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            )
          ],
        ),
        gauges.RadialAxis(
          minimum: 0,
          interval: 1,
          maximum: 3,
          showLabels: false,
          showTicks: true,
          showAxisLine: false,
          tickOffset: -0.05,
          offsetUnit: gauges.GaugeSizeUnit.factor,
          minorTicksPerInterval: 0,
          majorTickStyle: gauges.MajorTickStyle(
              length: 0.3,
              thickness: 3,
              lengthUnit: gauges.GaugeSizeUnit.factor,
              color: const Color(0xfff9f9f9)),
        )
      ],
    );
  }

  // function to count up hours given list of all reports and user id
  // should User object track this?
  // let index 0 be total;
  // 1-10 be for each interest; 11 be adjusted total for interests;
  // 12-13 be for campus/community
  // 14 be for residential
  List<double> countHours(List<Report> all, int uid) {
    List<double> counts = List<double>.filled(15, 0, growable: false);
    for (Report r in all) {
      if (r.uid == uid) {
        counts[0] += r.hours;
        // TODO: get event based on eid, made up one for now
        Event e = getRandEvent(r.eid);
        for (int i in e.interests) {
          // TODO: get interest based on id
          counts[i] += r.hours;
          counts[11] += r.hours;
        }
        if (e.isCommunity)
          counts[13] += r.hours;
        else
          counts[12] += r.hours;
        if (e.isResidential) counts[14]++;
      }
    }
    return counts;
  }

  Widget legendItem(String text, {Color color, Gradient gradient}) {
    Widget child;
    if (color == null) {
      child = Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(gradient: gradient, shape: BoxShape.circle),
        margin: const EdgeInsets.symmetric(horizontal: 10),
      );
    } else {
      child = Container(
        height: 15,
        width: 15,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          child,
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget legend() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          legendItem(
            'Progress to Service Award',
            gradient: SweepGradient(colors: <Color>[
              const Color(0xFF00a9b5),
              const Color(0xFFa4edeb)
            ], stops: <double>[
              0.25,
              0.75
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              legendItem(
                'Campus',
                color: camCom[0],
              ),
              SizedBox(width: 40),
              legendItem(
                'Community',
                color: camCom[1],
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
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
              ),
            ),
          )
        ],
      ),
    );
  }

  // bool toShow = false;
  // String legendLabel = 'Show Legend';

  @override
  Widget build(BuildContext context) {
    List<double> res = countHours(all, user.id);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(child: radialBar(res), height: 200, width: 200),
                Container(
                  child: serviceTypeDonut(res),
                  height: 300,
                  width: 300,
                ),
                Container(child: interestDonut(res), height: 390),
              ],
            ),
            legend(),
            // ActionChip(
            //   label: Text(legendLabel),
            //   onPressed: () {
            //     setState(() {
            //       toShow = !toShow;
            //       if (toShow)
            //         legendLabel = 'Hide Legend';
            //       else
            //         legendLabel = 'Show Legend';
            //     });
            //   },
            // ),
            // if (toShow) legend(),
          ],
        ),
      ),
      floatingActionButton: fab(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }

  Widget fab(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xffFFE400),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReportNewHours()),
        );
      },
      // mini: true,
      tooltip: 'Report Hours',
      child: Icon(Icons.add, color: Colors.black),
    );
  }
}
