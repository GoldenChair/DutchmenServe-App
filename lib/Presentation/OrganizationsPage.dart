import 'package:dutchmenserve/Infrastructure/cubit/organization_cubit.dart';
import 'package:dutchmenserve/Infrastructure/cubit/users_cubit.dart';
import 'package:dutchmenserve/Presentation/addOrganization.dart';
import 'package:dutchmenserve/Presentation/organizationInfo.dart';
import 'package:dutchmenserve/models/organization.dart';
import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/*
This class builds the page listing all organizations, 
allows user to follow organizations they are interested in,
click on any card to see more detailed info about the organization.

TODO: does this have to be stateful??
*/

class OrganizationsPage extends StatefulWidget {
  OrganizationsPage({Key key}) : super(key: key);

  @override
  _OrganizationsPage createState() {
    return _OrganizationsPage();
  }

  // static List<Organization> getOrgs() {
  //   // TODO void method, not sure how to return the list of orgs
  //   List<Organization> orgs = OrganizationCubit.getOrgs();
  //   return orgs;
  // }
}

class _OrganizationsPage extends State<OrganizationsPage> {
  _OrganizationsPage();
  // final List<Organization> orgs = [
  //   Organization(
  //       'Lebanon Valley Educational Partnership', 'B there or B square',
  //       id: 1, email: 'b@lvc.edu', officers: [1, 2, 3, 4, 5], members: [1, 2]),
  //   Organization('Colleges Against Cancer',
  //       'see me at Relay, this is a longer description',
  //       id: 2, email: 'c@lvc.edu', officers: [3], members: [3, 4, 5]),
  //   Organization('Alpha Phi Omega',
  //       'how fun fun fun we do so many fun things together with the brothers',
  //       id: 3,
  //       email: 'apo@lvc.edu',
  //       officers: [8],
  //       members: [6, 8, 9],
  //       imagepath: 'images/apo.jpeg'),
  //   Organization('AST', 'hello hi hi',
  //       id: 4, email: 'ast@lvc.edu', officers: [7], members: [7, 10, 12]),
  //   Organization('Gamma Sigma Sigma', 'xmas we organize the presents',
  //       id: 5, email: 'gs@lvc.edu', officers: [], members: [11, 12]),
  // ];

  //final List<Organization> orgs = OrganizationsPage.getOrgs();

  ListView buildOrgList(BuildContext context, List<Organization> orgs) {
    return ListView.separated(
      padding: EdgeInsets.all(20.0),
      itemBuilder: (BuildContext context, int index) {
        return createOrgCard(context, orgs[index]);
      },
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemCount: orgs.length,
    );
  }

  Widget createOrgCard(BuildContext context, Organization o1) {
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrgInfo(
                org: o1,
              ),
            ),
          );
        },
        leading: o1.imagepath == null
            ? CircleAvatar(
                backgroundColor: Colors.white54,
                radius: 25.0,
                child: Icon(
                  Icons.group_work,
                  size: 40,
                  color: Color(0xffDDDDDE),
                ))
            : CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(o1.imagepath),
              ),
        title: Container(
          margin: EdgeInsets.only(top: 15, bottom: 2),
          child: Text(
            o1.orgName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              o1.email,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.left,
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                o1.description,
                style: TextStyle(fontSize: 14),
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                if (state is UsersLoadedState) {
                  return ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      state.curUser.organizations.contains(o1.id)
                          ? FlatButton(
                              child: Text('Unfollow'),
                              onPressed: () {
                                setState(() {
                                  state.curUser.organizations.remove(o1.id);
                                  editUser(context, state.curUser);
                                  o1.members.remove(state.curUser.id);
                                  editOrgs(context, o1);
                                });
                              },
                            )
                          : FlatButton(
                              child: Text('Follow'),
                              onPressed: () {
                                setState(() {
                                  state.curUser.organizations.add(o1.id);
                                  editUser(context, state.curUser);
                                  o1.members.add(state.curUser.id);
                                  editOrgs(context, o1);
                                });
                              },
                            ),
                      FlatButton(
                        child: Text('Learn More'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrgInfo(
                                org: o1,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return Text("error");
                }
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrganizationCubit(),
      child: Scaffold(
        appBar: AppBar(title: Text("Service Organizations")),
        //body: buildOrgList(context, orgs),
        body: BlocBuilder<OrganizationCubit, OrganizationState>(
          builder: (context, state) {
            if (state is OrgLoadedState) {
              final orgs = state.orgs;
              return buildOrgList(context, orgs);
            } else if (state is OrgLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              //TODO return to homepage
              return Text("return to homepage");
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(right: 5, bottom: 15),
          child: FloatingActionButton(
            backgroundColor: Color(0xffFFE400),
            tooltip: 'Add a new organization',
            mini: true,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddOrgPage()));
            },
            child: Icon(Icons.add, color: Colors.black),
          ),
        ),
      ),
    );
  }

  void editUser(BuildContext context, User user) {
    final usersCubit = context.read<UsersCubit>();
    usersCubit.editUser(user);
  }

  void editOrgs(BuildContext context, Organization org) {
    final orgsCubit = context.read<OrganizationCubit>();
    orgsCubit.updateOrg(org);
  }
}
