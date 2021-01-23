import 'package:dutchmenserve/models/event.dart';

class User {
  String firstName;
  String lastName;
  String username;
  String password;
  String emailAddress;
  int id;
  List<int> interests;
  List<int> organizations;
  String imagepath;
  List<int> events;
  List<int> favorites;

  User(String firstName, String lastName, String username, String password,
      {String emailAddress,
      int id,
      List<int> interests,
      List<int> organizations,
      String imagepath,
      List<int> events,
      List<int> favorites}) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.username = username;
    this.password = password;
    this.emailAddress = emailAddress ?? (username + '@lvc.edu');
    this.id = id;
    this.interests = interests;
    this.organizations = organizations;
    this.imagepath = imagepath;
    this.events = events;
    this.favorites = favorites;
  }

  // convert User to a json Map
  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'password': password,
        'emailAddress': emailAddress,
        'id': id, // may be null
        'interests': interests ?? [],
        'organizations': organizations,
        'imagepath': imagepath,
        'events': events ?? [],
        'favorites': favorites ?? [],
      };

  // another constructor given a json Map
  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    username = json['username'];
    password = json['password'];
    emailAddress = json['emailAddress'];
    id = json['id'];
    interests = parseList(json['interests']);
    organizations = parseList(json['org']);
    imagepath = json['imagepath'];
    events = parseList(json['events']);
    favorites = parseList(json['favorites']);
  }

  List<int> parseList(List<dynamic> json) {
    return json != null ? List<int>.from(json) : null;
  }

  // List<Event> parseList(List<Map<String, dynamic>> json) {
  //   List<Event> res = [];
  //   for (int i = 0; i < json.length; i++) {
  //     res.add(Event.fromJSON(json[i]));
  //   }
  //   return res;
  // }

  // List<Organization> parseListO(List<Map<String, dynamic>> json) {
  //   List<Organization> res = [];
  //   for (int i = 0; i < json.length; i++) {
  //     res.add(Organization.fromJSON(json[i]));
  //   }
  //   return res;
  // }

  void register(Event e) {
    events.add(e.id);
    e.registered.add(id);
  }

  void registerAll(List<Event> ev) {
    for (var e in ev) {
      register(e);
    }
  }

  void printUser() {
    print(lastName + ', ' + firstName);
    print(username + ' | ' + password);
    print('id: ' + id.toString());
    print(interests.toString());
    print(events.toString());
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is User &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.username == username;
  }
}
