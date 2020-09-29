import 'package:dutchmenserve/cubit/organization_cubit.dart';
import 'package:dutchmenserve/models/organizations.dart';
import 'package:dutchmenserve/models/organizationsRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'organizationInfo.dart';

class OrganizationPage extends StatefulWidget {
  OrganizationPage({Key key}) : super(key: key);

  @override
  _OrganizationsPage createState() {
    return _OrganizationsPage();
  }
}

class _OrganizationsPage extends State<OrganizationPage> {
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrganizationCubit(orgRepo: OrganizationRepository()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("LVC Service Organizations"),
          backgroundColor: Colors.indigo[800],
        ),
        body: BlocBuilder<OrganizationCubit, OrganizationState>(
          builder: (context, state) {
            if (state is OrganizationInitial) {
              return buildInitial();
            } else if (state is LoadedState) {
              return buildOrgList(context, state.orgs);
            } else if (state is LoadingState) {
              return buildLoading();
            } else {
              return buildInitial();
            }
          },
        ),
      ),
    );
  }
}

Widget buildInitial() {
  return Container(
    child: Text('Organzations'),
  );
}

Widget buildLoading() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

ListView buildOrgList(BuildContext context, List<Organization> o1) {
  final orgCube = context.bloc<OrganizationCubit>();
  orgCube.getOrgs();
  return ListView.separated(
    padding: const EdgeInsets.all(20.0),
    itemBuilder: (BuildContext context, int index) {
      return Container(
        child: createOrgCard(context, o1[index]),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemCount: o1.length,
  );
}

//List<Icon> icons in parameter?
Container createOrgCard(BuildContext ctxt, Organization o1) {
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
              child: Text(o1.orgName),
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
