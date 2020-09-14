import 'dart:ui';

import 'package:flutter/material.dart';

class ConnectWUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contect Info'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: 400,
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    ButtonBar(
                      children: [
                        FlatButton(
                          onPressed: () {},
                          child: Text("Contact"),
                        )
                      ],
                    ),
                    const ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        size: 60,
                      ),
                      title: Text('Jennifer Liedtka'),
                      subtitle: Text('Coordinator of Service and Volunteerism'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
