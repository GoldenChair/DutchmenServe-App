import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dutchmenserve/Presentation/app_icons.dart';
import 'package:flutter/material.dart';

import 'setUpProfile.dart';
import 'usernameRegistration.dart';

/*
This class builds the initial page we launch that allows for users 
to either register for the first time or log in if they have already 
registered themselves on the app.

*/

class InitialLoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> statement = [
      'We empower students for a life of citizenship both in our community and around the globe.',
      'Students may enhance their self-knowledge as they examine their own identity and purpose in the context of a diverse world in which a variety of needs and injustices exist.',
      'Students may grow their awareness and knowledge regarding needs and justice issues in a variety of areas.',
    ];

    List<Widget> icons = [
      Icon(
        AppIcons.hearthands,
        size: 40,
        color: Colors.red[800],
        // color: Colors.indigo[500],
      ),
      Icon(
        AppIcons.analysis,
        size: 44,
        color: Colors.amber[300],
        // color: Colors.indigo[500],
      ),
      Container(
          child: Icon(
            AppIcons.plant,
            size: 30,
            color: Colors.teal[200],
            // color: Colors.indigo[500],
          ),
          margin: EdgeInsets.symmetric(horizontal: 8)),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(flex: 2),
              Container(
                  child: Center(
                      child: Text(
                'Dutchmen Serve',
                style: TextStyle(
                    fontFamily: 'BebasNeue',
                    fontSize: 50,
                    color: Color(0xff080644)),
              ))),
              Spacer(),
              createTextContainer(statement[0], icons[0], 10, 3),
              Spacer(),
              createTextContainer(statement[1], icons[1], 40, 4),
              Spacer(),
              createTextContainer(statement[2], icons[2], 70, 3),
              Spacer(),
              createButtons(context),
              Spacer(flex: 2)
            ],
          ),
        ],
      ),
    );
  }

  Widget createButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(flex: 2),
        createGradButton(
          'Register',
          LinearGradient(
            // begin: Alignment.topRight,
            // end: Alignment.bottomLeft,
            colors: <Color>[
              Colors.indigo[400],
              Colors.deepPurple[800],
              Colors.indigo[900],
              Colors.indigo,
            ],
          ),
          () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserNameReg()));
          },
        ),
        Spacer(),
        createGradButton(
          'Log In',
          LinearGradient(
            // begin: Alignment.topLeft,
            // end: Alignment.bottomRight,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
            colors: <Color>[
              Colors.indigo[400],
              Colors.deepPurple[800],
              Colors.indigo[900],
            ],
            // colors: <Color>[
            //   Colors.amber,
            //   Colors.yellowAccent,
            // ],
          ),
          () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginIn()));
          },
        ),
        Spacer(flex: 2),
      ],
    );
  }

  // function to create gradient button
  RaisedButton createGradButton(String s, LinearGradient lg, Function press) {
    return RaisedButton(
      onPressed: press,
      padding: EdgeInsets.all(0.0),
      textColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(90)),
          gradient: lg,
        ),
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        child: Container(
            decoration: BoxDecoration(
                border: null,
                borderRadius: BorderRadius.all(Radius.circular(90)),
                boxShadow: null,
                color: Color(0xfff9f9f9)),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 11),
            child: Text(s, style: TextStyle(color: Colors.black))),
      ),
    );
  }

  // function to create rounded text expandable
  Expanded createTextContainer(String s, Widget i, double margin, int mL) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(right: margin),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey[900]),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(70.0),
            bottomRight: Radius.circular(70.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(),
            Flexible(flex: 8, child: i),
            Spacer(),
            Flexible(
              flex: 25,
              child: AutoSizeText(
                s,
                style: TextStyle(fontFamily: 'KiteOne'),
                maxLines: mL,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createGradientHome(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Colors.blue[100],
                Colors.deepPurple[800],
                Colors.indigo[900]
              ],
              center: Alignment(0.6, -0.4),
              focal: Alignment(0.3, -0.1),
              focalRadius: 1.15,
            ),
          ),
        ),
        Column(
          children: [
            Spacer(),
            Container(
                child: Center(
                    child: Text(
              'Dutchmen Serve',
              style: TextStyle(
                  fontFamily: 'BebasNeue', fontSize: 50, color: Colors.white),
            ))),
            Spacer(),
            createButtons(context),
            Spacer(flex: 2),
          ],
        ),
        // BackdropFilter(
        //   filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        //   child: Center(
        //     child: Container(
        //       decoration: BoxDecoration(
        //           border: Border.all(
        //             color: Colors.white,
        //           ),
        //           borderRadius: BorderRadius.all(Radius.circular(20))),
        //     ),
        //   ),
        // ),
        // Center(
        //   child: Container(
        //     decoration: BoxDecoration(
        //       // border: Border.all(),
        //       borderRadius: BorderRadius.all(Radius.circular(20)),
        //       // color: Colors.indigo[900],
        //       color: Colors.yellow[50],
        //     ),
        //     child: createButtons(context),
        //     height: 200,
        //     width: 150,
        //   ),
        // )
      ],
    );
  }
}
