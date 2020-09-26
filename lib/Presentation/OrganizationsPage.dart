import 'package:flutter/material.dart';

import 'organizationInfo.dart';

class OrganizationsPage extends StatelessWidget {
  void _incrementCounter() {}

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
  final List<int> colorCodes = <int>[
    400,
    400,
    400,
    400,
    300,
    300,
    300,
    200,
    200,
    100,
    100,
    100,
    100,
  ];

  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LVC Service Organizations"),
        backgroundColor: Colors.indigo[800],
      ),
      body: Column(
        children: [
          // Checkbox(
          //   value: false,
          //   onChanged: (bool newValue) {
          //     Navigator.pop(ctxt); // Pop from stack
          //   },
          // ),
          new Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(20.0),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.indigo[colorCodes[index]],
                  child: Center(
                    child: RaisedButton(
                      child: Text('Entry ${entries[index]}'),
                      onPressed: () {
                        Navigator.push(
                          ctxt,
                          MaterialPageRoute(
                              builder: (context) => OrganizationInfo()),
                        );
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
//List<Icon> icons in parameter?
Expanded createCard(String orgName ) {
  return Expanded(
    child: Card(
      child: Column(
        children: [
          ListTile(
            title: Text(orgName),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              child: Row(
                children: [Text("Icons for involvement")],
              ),
            ),
          ),
          ButtonBar(
            children: [
              FlatButton(
                onPressed: () {},
                child: Text("Learn More"),
              )
            ],
          )
        ],
      ),
    ),
  );
}
