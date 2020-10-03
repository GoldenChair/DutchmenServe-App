import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'interestSelection.dart';

class addOrganization extends StatefulWidget {
  addOrganization({Key key}) : super(key: key);

  @override
  _addOrg createState() {
    return _addOrg();
  }
}

class _addOrg extends State<addOrganization> {
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
              SizedBox(
                height: 70,
              ),
              TextField(
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
      ),
    );
  }
}
