import 'dart:ui';

import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'profilePage.dart';

class LoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.grey,
            BlendMode.saturation,
          ),
          child: HomePage(),
        ),
        Container(
          child: Column(
            children: [
              // SizedBox(
              //   height: 600,
              // ),
              Container(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RaisedButton(
                    color: Colors.blue[800],
                    onPressed: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => SetUpPg1()));
                    },
                    child: Text('Log In ',
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class SetUpPg1 extends StatelessWidget {
  final user profile = new user();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();

  var username;
  var password;
  var confirm;

  @override
  void dispose1() {
    myController1.dispose();
  }

  @override
  void dispose2() {
    myController2.dispose();
  }

  @override
  void dispose3() {
    myController3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.account_circle,
                      size: 120,
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                TextField(
                    controller: myController1,
                    decoration: new InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black)),
                      hintText: 'U S E R N A M E',
                    )),
                SizedBox(height: 30),
                TextField(
                    decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  hintText: 'P A S S W O R D',
                )),
                SizedBox(height: 30),
                TextField(
                    decoration: new InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.black)),
                  hintText: 'C O N F I R M   P A S S W O R D',
                )),
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
                      color: Colors.blue[800],
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => _setUpPg2()));
                      },
                      child: Text('Next ',
                          style: TextStyle(
                            fontSize: 20,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));

    username = myController1.text;
    password = myController2.text;
    confirm = myController3.text;
    profile.setUsername(username);
    print(username);
  }
}

class _setUpPg2 extends StatefulWidget {
  _setUpPg2({Key key}) : super(key: key);

  @override
  SetUpPg2 createState() {
    return SetUpPg2();
  }
}

class SetUpPg2 extends State<_setUpPg2> {
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ToggleButtons(
                isSelected: _selections,
                children: [
                  Container(
                    height: 175,
                    width: 204,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Icon(
                          Icons.gavel,
                          size: 100,
                          color:
                              _selections[0] ? Colors.blue[800] : Colors.black,
                        ),
                        Text('Advocacy & Human Rights'),
                      ],
                    ),
                  ),
                  Container(
                    height: 175,
                    width: 204,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtons(
                  isSelected: s2,
                  children: [
                    Container(
                      height: 175,
                      width: 204,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Icon(Icons.color_lens,
                              size: 100,
                              color: s2[0] ? Colors.blue[800] : Colors.black),
                          Text('Arts & Culture'),
                        ],
                      ),
                    ),
                    Container(
                      height: 175,
                      width: 204,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                          ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtons(
                isSelected: s3,
                children: [
                  Container(
                    height: 175,
                    width: 204,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Icon(Icons.group,
                            size: 100,
                            color: s3[0] ? Colors.blue[800] : Colors.black),
                        Text('Community'),
                      ],
                    ),
                  ),
                  Container(
                    height: 175,
                    width: 204,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Icon(Icons.computer,
                            size: 100,
                            color: s3[1] ? Colors.blue[800] : Colors.black),
                        Text('Computers & Technology'),
                      ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtons(
                isSelected: s4,
                children: [
                  Container(
                    height: 175,
                    width: 204,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Icon(Icons.school,
                            size: 100,
                            color: s4[0] ? Colors.blue[800] : Colors.black),
                        Text('Education & Literacy'),
                      ],
                    ),
                  ),
                  Container(
                    height: 175,
                    width: 204,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
                        Icon(Icons.face,
                            size: 100,
                            color: s4[1] ? Colors.blue[800] : Colors.black),
                        Text('Seniors'),
                      ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ToggleButtons(
                isSelected: s5,
                children: [
                  Container(
                    height: 175,
                    width: 204,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40),
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
                    height: 175,
                    width: 204,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
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
          RaisedButton(
            color: Colors.blue[800],
            onPressed: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => SetUpOrg()));
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

class SetUpOrg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selct your Organizations'),
      ),
      body: ListView(
        children: [
          Center(
            child: Container(
              height: 50,
              width: 200,
              color: Colors.blue[300],
              child: Text('Organization 1'),
            ),
          ),
          Container(
            child: Text('Organization 1'),
          ),
          Container(
            child: Text('Organization 1'),
          )
        ],
      ),
    );
  }
}

class SetUpPg3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => HomePage()));
          },
          label: Text('Submit'),
          icon: Icon(Icons.done),
          backgroundColor: Colors.blue[800],
        ),
        body: ProfilePage());
  }
}
