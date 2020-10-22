import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/cupertino.dart';

class Organization {
  String orgName;
  List usersIDs;
  int orgID;
  List officers;
  String description;
  String email;

  Organization({
    @required this.orgName,
    @required this.description,
    @required this.email,
    this.orgID,
    this.usersIDs,
    @required this.officers,

    //     @required this.orgName,
    // @required this.orgID,
    // @required this.usersIDs,
    // @required this.officers,
  });
  void setOrgName(String s) {
    this.orgName = s;
  }

  void printOrgName() {
    print(this.orgName);
  }

  void addMembers(User u) {
    usersIDs.add(u.id);
  }
}
