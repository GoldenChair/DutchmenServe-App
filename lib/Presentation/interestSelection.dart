import 'dart:ui';
import 'package:dutchmenserve/Presentation/buttons.dart';
import 'package:dutchmenserve/Presentation/organizationSelect.dart';
import 'package:dutchmenserve/models/interest.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';

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

  final Color iconColor = Color(0xff002A4E);
  final List<Interest> interests = [
    Interest('Animals'),
    Interest('Disabilities'),
    Interest('Education'),
    Interest('Food'),
    Interest('Health \nWellness'),
    Interest('Housing'),
    Interest('Older Adults'),
    Interest('Service Trips'),
    Interest('Veterans'),
    Interest('Other'),
  ];

  List<bool> _s = List.generate(12, (index) => false);

  @override
  Widget build(BuildContext context) {
    final List<Icon> icons = [
      Icon(Icons.pets, semanticLabel: 'Animals', color: iconColor),
      Icon(Icons.accessible, semanticLabel: 'Disabilities', color: iconColor),
      Icon(Icons.school, semanticLabel: 'Education', color: iconColor),
      Icon(Icons.local_restaurant, semanticLabel: 'Food', color: iconColor),
      Icon(Icons.healing,
          semanticLabel: 'Health and Wellness', color: iconColor),
      Icon(Icons.home, semanticLabel: 'Housing', color: iconColor),
      Icon(Icons.face, semanticLabel: 'Older Adults', color: iconColor),
      Icon(Icons.explore, semanticLabel: 'Service Trips', color: iconColor),
      Icon(Icons.stars, semanticLabel: 'Veterans', color: iconColor),
      Icon(Icons.more_horiz, semanticLabel: 'Other', color: iconColor),
    ];

    List<Column> widgets = List.generate(
      10,
      (index) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: icons[index],
            flex: 4,
          ),
          // icons[index],
          Flexible(
            child: Text(
              interests[index].interest,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text('Select your interests')),
      backgroundColor: Color(0xfff9f9f9),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(child: Container(color: Color(0xffFFE400))),
                  Flexible(
                    flex: 10,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                          child: GridView.count(
                              crossAxisCount: 3,
                              children: widgets.asMap().entries.map(
                                (widget) {
                                  return Container(
                                    child: LayoutBuilder(
                                      builder: (context, constraints) {
                                        return ToggleButtons(
                                          selectedColor: Color(0xff206090),
                                          fillColor: Colors.blue[50],
                                          splashColor: Color(0xff95C1DC),
                                          constraints: BoxConstraints.expand(
                                            width: constraints.maxWidth - 2,
                                          ),
                                          isSelected: [_s[widget.key]],
                                          onPressed: (int key) {
                                            // note: key stays 0 and never changes, don't use; use widget.key
                                            setState(() {
                                              _s[widget.key] = !_s[widget.key];
                                            });
                                          },
                                          children: [widget.value],
                                        );
                                      },
                                    ),
                                  );
                                },
                              ).toList()),
                        ),
                      ],
                    ),
                  ),
                  Flexible(child: Container(color: Color(0xffFFE400))),
                ],
              ),
            ),
            Container(
              // color: Color(0xffFFE400),
              margin: EdgeInsets.only(top: 10),
              child: NormalButton(
                'Next',
                () {
                  for (int i = 0; i < 11; i++) {
                    if (_s[i]) user.interests.add(i);
                  }
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => setUpOrgPage(user: user)));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
