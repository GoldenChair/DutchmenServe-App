import 'package:dutchmenserve/Infrastructure/cubit/organization_cubit.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/Presentation/addOrganization.dart';
import 'package:dutchmenserve/models/organizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrgInfo extends StatelessWidget {
  final Organization orgToDisplay;

  OrgInfo({Key key, @required this.orgToDisplay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrganizationCubit>(
        create: (context) => OrganizationCubit(orgRepo: FakeRepository()),
        child: OrganizationInfo(
          orgToDisplay: orgToDisplay,
        ));
  }
}

class OrganizationInfo extends StatelessWidget {
  final Organization orgToDisplay;
  OrganizationInfo({Key key, @required this.orgToDisplay}) : super(key: key);
  @override
  Widget build(BuildContext ctxt) {
    return BlocProvider<OrganizationCubit>(
      create: (context) => OrganizationCubit(orgRepo: FakeRepository()),
      child: Scaffold(
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
                Text(
                  orgToDisplay.orgName,
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    color: Colors.black,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  orgToDisplay.description,
                  style: TextStyle(
                      fontFamily: 'SourceSansPro',
                      color: Colors.black54,
                      fontSize: 20.0,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                    height: 20.0,
                    width: 120.0,
                    child: Divider(color: Colors.black54)),
                Card(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: ListTile(
                      leading: Icon(Icons.email, color: Colors.black54),
                      title: Text("test@lvc.",
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
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Text("Edit"),
                  heroTag: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  onPressed: () {
                    removeOrganization(ctxt, orgToDisplay);
                    Navigator.push(ctxt,
                        new MaterialPageRoute(builder: (context) => OrgPage()));
                  },
                  child: Text("Delete"),
                  heroTag: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void removeOrganization(BuildContext context, Organization org) {
    //final orgCubit;
    final orgCubit = context.bloc<OrganizationCubit>();
    orgCubit.removeOrg(org);
  }
}
