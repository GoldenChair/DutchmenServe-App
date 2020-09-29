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
      body: ListView.separated(
        padding: const EdgeInsets.all(20.0),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: createOrgCard(context, entries[index], "test"),
          );
          // return Container(
          //   height: 50,
          //   color: Colors.indigo[colorCodes[index]],
          //   child: Center(
          //     child: RaisedButton(
          //       child: Text('Entry ${entries[index]}'),
          //       onPressed: () {
          //         Navigator.push(
          //           ctxt,
          //           MaterialPageRoute(
          //               builder: (context) => OrganizationInfo()),
          //         );
          //       },
          //     ),
          //   ),
          // );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}

//List<Icon> icons in parameter?
Container createOrgCard(BuildContext ctxt, String orgName, String imagePath) {
  return Container(
    //padding: EdgeInsets.all(25),
    child: Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
            //this will be an imagepath some day
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                (Icons.group),
                size: 40,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(orgName),
            ),
          ),
          // Image.asset(imagePath),
          ButtonBar(
            alignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                textColor: Colors.indigoAccent,
                onPressed: () {
                  Navigator.push(
                    ctxt,
                    MaterialPageRoute(builder: (context) => OrganizationInfo()),
                  );
                  // Perform some action
                },
                child: Text('Learn More'),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

