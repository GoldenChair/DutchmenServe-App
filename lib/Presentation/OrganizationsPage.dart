import 'package:dutchmenserve/Infrastructure/cubit/organization_cubit.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/Presentation/addOrganization.dart';
import 'package:dutchmenserve/Presentation/organizationInfo.dart';
import 'package:dutchmenserve/models/organization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class OrganizationsPage extends StatefulWidget {
  OrganizationsPage({Key key}) : super(key: key);

  @override
  _OrganizationsPage createState() {
    return _OrganizationsPage();
  }
}

class _OrganizationsPage extends State<OrganizationsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrganizationCubit(),
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
              final orgs = state.orgs;
              return buildOrgList(context, orgs);
            } else if (state is LoadingState) {
              return buildLoading();
            } else {
              return buildInitial();
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => OrgPage()));
          },
          child: Icon(Icons.add),
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
Container createOrgCard(BuildContext context, Organization o1) {
  //final orgCube = context.bloc<OrganizationCubit>();
  //orgCube.getOrgs();
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
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrgInfo(
                        orgToDisplay: o1,
                      ),
                    ),
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
