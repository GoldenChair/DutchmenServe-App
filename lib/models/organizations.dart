import 'package:flutter/cupertino.dart';

class Organization {
  String orgName;
  List usersIDs;
  int orgID;
  List<int> officers;


  Organization({
    @required this.orgName,
    @required this.orgID,
    @required this.usersIDs,
    @required this.officers,
  });
}
