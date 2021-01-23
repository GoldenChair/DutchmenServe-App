import 'package:dutchmenserve/Infrastructure/cubit/organization_cubit.dart';
import 'package:dutchmenserve/Infrastructure/repository.dart';
import 'package:dutchmenserve/Presentation/OrganizationsPage.dart';
import 'package:dutchmenserve/models/organization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrgPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrganizationCubit>(
      create: (context) => OrganizationCubit(),
      child: AddOrganization(),
    );
  }
}

class AddOrganization extends StatefulWidget {
  AddOrganization({Key key}) : super(key: key);

  @override
  _AddOrg createState() {
    return _AddOrg();
  }
}

class _AddOrg extends State<AddOrganization> {
  Organization newOrg = new Organization('OrgName', 'd');
  final orgName = TextEditingController();
  //newOrg.orgName(orgName.text);
  // newOrg.setOrgName(orgName.text);
  @override
  void dispose() {
    super.dispose();
    orgName.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          newOrg.orgName = orgName.text;
          print(newOrg.orgName);
          // return showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       content: Text(orgName.text),
          //     );
          //   },
          // );
          submitOrganization(context, newOrg);
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => OrganizationPage()));
        },
        child: Text("Submit"),
      ),
    );
  }

  void submitOrganization(BuildContext context, Organization org) {
    //final orgCubit;
    final orgCubit = context.watch<OrganizationCubit>();
    orgCubit.addOrg(org);
  }
}
