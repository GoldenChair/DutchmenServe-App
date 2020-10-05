import 'package:dutchmenserve/models/organizations.dart';
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
    Organization newOrg = new Organization(orgName: null);
    final orgName = TextEditingController();

    @override
    void dispose() {
      orgName.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Organization'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              TextFormField(
                controller: orgName,
                decoration: InputDecoration(
                    icon: Icon(Icons.group), labelText: 'Name *'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(orgName.text),
              );
            },
          );
        },
        child: Text("Submit"),
      ),
    );
  }
}
