import 'package:flutter/foundation.dart';

import 'category.dart';
import 'organizations.dart';

class User {
  String username;
  String password;
  String emailAddress;
  List<Category> needs;
  List<organization> org;

  User() {}
  void setUsername(String name) {
    username = name;
  }

  void setEmail() {
    emailAddress = username + "@lvc.edu";
  }

  void addInterests() {
    // needs.add(value);
  }
  void addOrganizzation() {
    //org.add(value);
  }
  String getUsername() {
    return username;
  }

  String getEmail() {
    return emailAddress;
  }

  List getNeeds() {
    return needs;
  }

  List getOrg() {
    return org;
  }
}
