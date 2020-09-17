import 'dart:ui';

import 'package:flutter/material.dart';

import 'setUpConfirmation.dart';

/*
Scrollable checklist to select the orgnizations a user is a part of
*/

class setUpOrgPage extends StatefulWidget {
  setUpOrgPage({Key key}) : super(key: key);

  @override
  SetUpOrgState createState() {
    return SetUpOrgState();
  }
}

class SetUpOrgState extends State<setUpOrgPage> {
  final List<String> entries = <String>[
    'Alpha Phi Omega',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M'
  ];
  List<bool> _isChecked = List.generate(13, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Selct your Organizations'),
        ),
        body: Column(
          children: [
            new Expanded(
                child: ListView.separated(
                    padding: const EdgeInsets.all(20.0),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: CheckboxListTile(
                          title: Text('${entries[index]}'),
                          activeColor: Colors.blue[900],
                          value: _isChecked[index],
                          onChanged: (value) {
                            setState(() {
                              _isChecked[index] = !_isChecked[index];
                            });
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: entries.length)),
            RaisedButton(
              color: Colors.blue[800],
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => registrationConfirm()));
              },
              child: Text('Next ',
                  style: TextStyle(
                    fontSize: 20,
                  )),
            ),
          ],
        ));
  }
}
