import 'dart:ui';

import 'package:flutter/material.dart';

import 'organizationSelect.dart';

/*
Page to select interests by having the user
click on the interests.
 */

class SelectInterests extends StatefulWidget {
  SelectInterests({Key key}) : super(key: key);

  @override
  _SelectInterestsState createState() {
    return _SelectInterestsState();
  }
}

class _SelectInterestsState extends State<SelectInterests> {
  List<bool> _selections = List.generate(2, (index) => false);
  List<bool> s2 = List.generate(2, (index) => false);
  List<bool> s3 = List.generate(2, (index) => false);
  List<bool> s4 = List.generate(2, (index) => false);
  List<bool> s5 = List.generate(2, (index) => false);
  List<bool> s6 = List.generate(2, (index) => false);
  bool _rights = true;

  var interestType = [
    'Advocacy & Human Rights',
    'Animals',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select your interests'),
      ),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtons(
                isSelected: _selections,
                children: [
                  Container(
                    // height: 175,
                    width: 150,
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(
                          Icons.gavel,
                          size: 100,
                          color:
                              _selections[0] ? Colors.blue[800] : Colors.black,
                        ),
                        Flexible(
                          child: Text('Advocacy & Human Rights'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 30),
                    // height: 175,
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(Icons.pets,
                            size: 100,
                            color: _selections[1]
                                ? Colors.blue[800]
                                : Colors.black),
                        Text('Animals'),
                      ],
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    _selections[index] = !_selections[index];
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtons(
                  isSelected: s2,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 30, top: 30),
                      // height: 175,
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Icon(Icons.color_lens,
                              size: 100,
                              color: s2[0] ? Colors.blue[800] : Colors.black),
                          Text('Arts & Culture'),
                        ],
                      ),
                    ),
                    Container(
                      //height: 175,
                      margin: EdgeInsets.only(right: 30),
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Icon(Icons.child_care,
                              size: 100,
                              color: s2[1] ? Colors.blue[800] : Colors.black),
                          Text('Children & Youth'),
                        ],
                      ),
                    ),
                  ],
                  onPressed: (int index) {
                    setState(() {
                      s2[index] = !s2[index];
                    });
                  }),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtons(
                isSelected: s3,
                children: [
                  Container(
                    // height: 175,
                    width: 150,
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Icon(Icons.group,
                            size: 100,
                            color: s3[0] ? Colors.blue[800] : Colors.black),
                        Text('Community'),
                      ],
                    ),
                  ),
                  Container(
                    // height: 175,
                    width: 150,
                    margin: EdgeInsets.only(right: 30),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Icon(Icons.computer,
                              size: 100,
                              color: s3[1] ? Colors.blue[800] : Colors.black),
                          Text('Technology'),
                        ],
                      ),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    s3[index] = !s3[index];
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtons(
                isSelected: s4,
                children: [
                  Center(
                    child: Container(
                      // height: 175,
                      width: 150,
                      margin: EdgeInsets.only(left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spacer(),
                          Icon(Icons.school,
                              size: 100,
                              color: s4[0] ? Colors.blue[800] : Colors.black),
                          Text('Education & Literacy'),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      // height: 175,
                      width: 150,
                      margin: EdgeInsets.only(right: 30),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer(
                              flex: 5,
                            ),
                            Icon(Icons.face,
                                size: 100,
                                color: s4[1] ? Colors.blue[800] : Colors.black),
                            Text('Seniors'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  setState(() {
                    s4[index] = !s4[index];
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtons(
                isSelected: s5,
                children: [
                  Container(
                    // height: 175,
                    width: 150,
                    margin: EdgeInsets.only(left: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(
                          Icons.more_horiz,
                          size: 100,
                          color: s5[0] ? Colors.blue[800] : Colors.black,
                        ),
                        Text('Other'),
                      ],
                    ),
                  ),
                  Container(
                    // height: 175,
                    width: 150,
                    margin: EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Spacer(),
                        Icon(
                          Icons.all_inclusive,
                          size: 100,
                          color: s5[1] ? Colors.blue[800] : Colors.black,
                        ),
                        Text('All'),
                      ],
                    ),
                  )
                ],
                onPressed: (int index) {
                  setState(() {
                    s5[index] = !s5[index];
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            color: Colors.blue[800],
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => setUpOrgPage()));
            },
            child: Text('Next ',
                style: TextStyle(
                  fontSize: 20,
                )),
          ),
        ]),
      ),
    );
  }
}
