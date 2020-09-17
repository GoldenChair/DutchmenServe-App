import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';
import 'profilePage.dart';
import 'usernameRegistration.dart';
import 'setUpProfile.dart';

/*
This class builds the initial page we launch that allows for users 
to either register for the first time or log in if they have already 
registered themselves on the app.

*/


class InitialLoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Center(
            child: Text(
          'Dutchmen Serve',
          style: TextStyle(fontFamily: 'BebasNeue', fontSize: 40),
        )),
      ),
      body: Column(
        //have row and then put in the column
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Spacer(),
          createExpanded(
            'We empower students for a life of citizenship both in our community and around the globe.',
            Icons.public,
            10,
          ),
          Spacer(),
          createExpanded(
            'Students may enhance their self-knowledge as they examine their own identity and purpose in the context of a diverse world in which a variety of needs and injustices exist.',
            Icons.people,
            40,
          ),
          Spacer(),
          createExpanded(
            'Students may grow their awareness and knowledge regarding needs and justice issues in a variety of areas.',
            Icons.gavel,
            70,
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        color: Colors.blue[800],
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => userNameReg()));
                        },
                        child: Text('Register ',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Container(
                    child: Align(
                      alignment: Alignment.center,
                      child: RaisedButton(
                        color: Colors.blue[800],
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => LoginIn()));
                        },
                        child: Text('Log In ',
                            style: TextStyle(
                              fontSize: 20,
                            )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
  // function to create rounded text expandable
  Expanded createExpanded(String s, IconData iconData, double margin) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(right: margin),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70.0),
            bottomRight: Radius.circular(70.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Flexible(
              flex: 8,
              child: Icon(
                iconData,
                size: 50,
                color: Colors.black,
              ),
            ),
            Spacer(),
            Flexible(
              flex: 25,
              // child: Padding(
              //   padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              //   child: Text(
              //     s,
              //     style: TextStyle(fontFamily: 'KiteOne', fontSize: 14),
              //   ),
              // ),
              child: AutoSizeText(
                s,
                style: TextStyle(fontFamily: 'KiteOne'),
                maxLines: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}