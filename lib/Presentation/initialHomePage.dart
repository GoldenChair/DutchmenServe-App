import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dutchmenserve/Presentation/app_icons.dart';
import 'package:dutchmenserve/Presentation/buttons.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'usernameRegistration.dart';

import 'package:flutter/services.dart';

/*
This class builds the initial page we launch that allows for users 
to either register for the first time or log in if they have already 
registered themselves on the app.

*/

class InitialLoginHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xff001d35),
      systemNavigationBarColor: Color(0xff002A4E),
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    List<String> statement = [
      'We empower students for a life of citizenship both in our community and around the globe.',
      'We enhance our self-knowledge as we examine our own identity and purpose within a diverse world.',
      'We grow our awareness and knowledge for needs and justice issues in a variety of areas.',
    ];

    List<Widget> icons = [
      Icon(
        AppIcons.hearthands,
        size: 40,
        color: Color(0xff95C1DC),
      ),
      Icon(
        AppIcons.analysis,
        size: 44,
        color: Color(0xff95C1DC),
      ),
      Container(
          child: Icon(
            AppIcons.plant,
            size: 30,
            color: Color(0xff95C1DC),
          ),
          margin: EdgeInsets.symmetric(horizontal: 8)),
    ];

    return Scaffold(
      backgroundColor: Color(0xff002B4E),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        toolbarHeight: 90,
        backgroundColor: Color(0xff001d35),
        centerTitle: true,
        title: Text(
          'Dutchmen Serve',
          style: TextStyle(
            fontFamily: 'BebasNeue',
            fontSize: 55,
            fontWeight: FontWeight.normal,
            color: Color(0xff95C1DC),
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Container(
                child: Image(image: AssetImage('images/lvc_white.png')),
                padding: EdgeInsets.symmetric(horizontal: 80),
              ),
              Container(
                alignment: Alignment.center,
                child: AutoSizeText(
                  'Office of Community Service and Volunteerism',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    color: Color(0xffDDDDDE),
                  ),
                  maxLines: 2,
                ),
              ),
              Spacer(),
              createTextContainer(statement[0], icons[0], 10, 3),
              Spacer(),
              createTextContainer(statement[1], icons[1], 40, 4),
              Spacer(),
              createTextContainer(statement[2], icons[2], 70, 3),
              Spacer(),
              Center(child: createButtons(context)),
            ],
          ),
        ],
      ),
    );
  }

  Widget createButtons(BuildContext context) {
    return Column(
      children: [
        NormalButton(
          'Sign in',
          () {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Color(0xff002A4E),
              systemNavigationBarColor: Color(0xfff9f9f9),
              systemNavigationBarIconBrightness: Brightness.dark,
            ));
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          },
          color: Color(0xffFFE400),
          textColor: Colors.black,
        ),
        TextButton(
          child: Text(
            'Create account',
            style: TextStyle(
              color: Color(0xffFFE400),
              decoration: TextDecoration.underline,
              fontSize: 16,
            ),
          ),
          onPressed: () {
            SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Color(0xff002A4E),
              systemNavigationBarColor: Color(0xfff9f9f9),
              systemNavigationBarIconBrightness: Brightness.dark,
            ));
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserNameReg()));
          },
        ),
      ],
    );
  }

  // function to create rounded text expandable
  Expanded createTextContainer(String s, Widget i, double margin, int mL) {
    return Expanded(
      flex: 3,
      child: Container(
        margin: EdgeInsets.only(right: margin),
        decoration: BoxDecoration(
          // color: Color(0xfff9f9f9),
          color: Colors.white,
          border: Border.all(color: Color(0xff95C1DC)),
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
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: AutoSizeText(
                  s,
                  style: TextStyle(
                    fontFamily: 'KiteOne',
                    color: Colors.black,
                  ),
                  maxLines: mL,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
