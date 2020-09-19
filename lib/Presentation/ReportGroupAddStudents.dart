// Additional page for when reporting new hours for a group
// to allow user to check the students/organizations to include

//TODO: clean up, fix checkboxes and list

import 'package:flutter/material.dart';

class NewGroup {
  bool isExpanded;
  final String header;
  final Widget body;
  NewGroup(this.isExpanded, this.header, this.body);
}

class ReportGroupAddStudents extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      body: Center(
        child: AddStudentsStateful(),
      ),
    );
  }
}

class AddStudentsStateful extends StatefulWidget {
  AddStudentsStateful({Key key}) : super(key: key);

  @override
  _AddStudentsState createState() => _AddStudentsState();
}

class _AddStudentsState extends State<AddStudentsStateful> {
  bool checked = false;

  // data: list of student names
  List<NewGroup> items = <NewGroup>[
    NewGroup(
      false, // isExpanded ?
      'Alpha Phi Omega', // header
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text('Student'),
          ],
        ),
      ), // body
    ),
    NewGroup(
      false, // isExpanded ?
      'Gamma Sigma Sigma', // header
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            CheckboxListTile(
                title: Text('Mackenzie Stewart'),
                value: false,
                onChanged: (newValue) {
                  // setState(() {
                  //   val = newValue;
                  // });
                }),
            CheckboxListTile(
              title: Text('Allison Liu'),
              value: false,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ), // body
    ),
  ];
  ListView List_Criteria;

  @override
  Widget build(BuildContext context) {
    List_Criteria = ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: items.map((NewGroup item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                      leading: Checkbox(
                        value: false,
                        onChanged: (bool newValue) {},
                      ),
                      title: Text(
                        item.header,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ));
                },
                isExpanded: item.isExpanded,
                body: item.body,
              );
            }).toList(),
          ),
        ),
      ],
    );
    Scaffold scaffold = Scaffold(
      appBar: AppBar(
        title: Text('New Report- Add Students'),
        backgroundColor: Colors.indigo[800],
      ),
      body: List_Criteria,
    );
    return scaffold;
  }
}
