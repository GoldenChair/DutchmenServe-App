import 'dart:ui';
import 'package:dutchmenserve/Presentation/widgets.dart';
import 'package:dutchmenserve/Presentation/organizationSelect.dart';
import 'package:dutchmenserve/models/interest.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/*
Page to select interests by having the user
click on the interests.
 */

class SelectInterests extends StatefulWidget {
  final User user;
  SelectInterests({Key key, @required this.user}) : super(key: key);

  @override
  _SelectInterestsState createState() {
    return _SelectInterestsState(user);
  }
}

class _SelectInterestsState extends State<SelectInterests> {
  User user;
  _SelectInterestsState(this.user);

  final List<Interest> interests = [
    Interest('Animals'),
    Interest('Disabilities'),
    Interest('Education'),
    Interest('Food'),
    Interest('Health\nWellness'),
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

  List<bool> _s = List.generate(12, (index) => false);

  Color changeColor(int i) {
    if (_s[i])
      return colors[i];
    else
      return Color(0xff002A4E);
  }

  List<Column> generateWidgets() {
    return List.generate(
      10,
      (index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: Icon(
              icons[index],
              size: 40,
              semanticLabel: interests[index].interest,
              color: changeColor(index),
            ),
          ),
          Flexible(
            child: Text(
              interests[index].interest,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Flexible createGridView(List<Column> widgets) {
    return Flexible(
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          children: widgets.asMap().entries.map(
            (widget) {
              return Container(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      color: Color(0xffDDDDDE),
                      child: ToggleButtons(
                        selectedColor: Colors.black,
                        fillColor: fillColors[widget.key],
                        splashColor: Colors.transparent,
                        renderBorder: false,
                        constraints: BoxConstraints.expand(
                          width: constraints.maxWidth - 20,
                        ),
                        isSelected: [_s[widget.key]],
                        onPressed: (int key) {
                          // note: key stays 0 and never changes, don't use; use widget.key
                          setState(() {
                            _s[widget.key] = !_s[widget.key];
                          });
                        },
                        children: [widget.value],
                      ),
                    );
                  },
                ),
              );
            },
          ).toList()),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Column> w = generateWidgets();
    return Scaffold(
      appBar: AppBar(title: Text('Select your interests')),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(child: Container()),
                  Flexible(
                    flex: 16,
                    child: Column(
                      children: <Widget>[
                        createGridView(w),
                      ],
                    ),
                  ),
                  Flexible(child: Container()),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 5),
              child: NormalButton(
                'Next',
                () {
                  for (int i = 0; i < 11; i++) {
                    if (_s[i]) user.interests.add(i);
                  }
                  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
                    statusBarColor: Color(0xff002A4E),
                    systemNavigationBarColor: Color(0xfff9f9f9),
                    systemNavigationBarIconBrightness: Brightness.dark,
                  ));
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => SetUpOrgPage(user: user)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
