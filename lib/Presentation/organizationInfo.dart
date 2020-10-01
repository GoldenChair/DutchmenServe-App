import 'package:flutter/material.dart';

class OrganizationInfo extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[800],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              CircleAvatar(
                radius: 65.0,
                backgroundImage: AssetImage('images/apo.jpeg'),
              ),
              Text('Alpha Phi Omega',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  )),
              Text('description...',
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.black54,
                      fontSize: 20.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                  height: 20.0,
                  width: 120.0,
                  child: Divider(color: Colors.black54)),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.black54),
                    title: Text('emailme@gmail.com',
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                        )),
                  )),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(
                    leading:
                        Icon(Icons.supervisor_account, color: Colors.black54),
                    title: Text('Officer Name',
                        style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'SourceSansPro',
                          fontSize: 20,
                        )),
                  )),
              SizedBox(
                  height: 20.0,
                  width: 120.0,
                  child: Divider(color: Colors.black54)),
              Container(
                child: Text("M E M B E R S"),
              ),
              SizedBox(
                  height: 20.0,
                  width: 120.0,
                  child: Divider(color: Colors.black54)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    elevation: .75,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ListTile(
                      leading:
                          Icon(Icons.account_circle, color: Colors.black54),
                      title: Text('Steve Rogers',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    elevation: .75,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ListTile(
                      leading:
                          Icon(Icons.account_circle, color: Colors.black54),
                      title: Text('Tony Stark',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                          )),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    elevation: .75,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ListTile(
                      leading:
                          Icon(Icons.account_circle, color: Colors.black54),
                      title: Text('Peter Parker',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'SourceSansPro',
                            fontSize: 20,
                          )),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
