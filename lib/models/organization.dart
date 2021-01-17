import 'dart:convert';

import 'package:dutchmenserve/models/user.dart';
import 'package:flutter/cupertino.dart';

class Organization {
  int id;
  String orgName;
  String description;
  String email;
  String imagepath;
  List members;
  List officers;
  bool deleted;

  Organization(String orgName, String description,
      {int id,
      String email,
      String imagepath,
      List<int> members,
      List<int> officers}) {
    this.orgName = orgName;
    this.description = description;
    this.id = id;
    this.email = email;
    this.imagepath = imagepath;
    this.members = members ?? <int>[];
    this.officers = officers ?? <int>[];
    deleted = false;
  }

  // convert Organization to a json Map
  Map<String, dynamic> toJson() => {
        'orgName': orgName,
        'description': description,
        'id': id, // may be null
        'email': email, // may be null
        'imagePath': imagepath, // may be null
        'users': members,
        'officers': officers,
        'deleted': deleted,
      };

  // another constructor given a json Map
  Organization.fromJson(Map<String, dynamic> json) {
    orgName = json['orgName'];
    description = json['description'];
    id = json['id'];
    email = json['email'];
    imagepath = json['imagepath'];
    members = parseList(json['users']);
    officers = parseList(json['officers']);
    deleted = json['deleted'];
  }

  List<int> parseList(List<dynamic> json) {
    return json != null ? List<int>.from(json) : null;
  }

  // List<User> parseList(List<Map<String, dynamic>> json) {
  //   var res = <User>[];
  //   for (var i = 0; i < json.length; i++) {
  //     res.add(User.fromJSON(json[i]));
  //   }
  //   return res;
  // }

  // List<Organization> parseListO(List<Map<String, dynamic>> json) {
  //   var res = <Organization>[];
  //   for (var i = 0; i < json.length; i++) {
  //     res.add(Organization.fromJSON(json[i]));
  //   }
  //   return res;
  // }

  // would it be better to add ids or User objects?

  void delete() {
    this.deleted = true;
  }

  void addMember(int i) {
    members.add(i);
  }

  void addMembers(List<int> ints) {
    members.addAll(ints);
  }

  void addOfficer(int i) {
    officers.add(i);
  }

  void addOfficers(List<int> ints) {
    officers.addAll(ints);
  }

  void printOrganization() {
    print(orgName + ', ' + description);
    print('id: ' + id.toString());
    print(members.toString());
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Organization &&
        o.orgName == orgName &&
        o.description == description;
  }
}
