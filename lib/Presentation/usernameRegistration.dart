import 'dart:ui';

import 'package:dutchmenserve/Presentation/interestSelection.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';

/*
This class will prompt for a username and password and for password 
confirmation for registrationpurposes
*/

class userNameReg extends StatelessWidget {
  final User profile = new User();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();

  var username;
  var password;
  var confirm;

  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
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
                                builder: (context) => SelectInterests()));
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
    //profile.setUsername(username);
    print(username);
  }
}
