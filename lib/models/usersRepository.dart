import 'package:dutchmenserve/models/user.dart';

class userRepository {
  List<User> getUsers() {
    try {
      final users = [
        User(
          emailAddress: "mjs016@lvc.edu",
          interests: ['animals'],
          org: [1],
          password: "password",
          username: "mjs016", events: [],
        ),
        User(
          emailAddress: "ajl008@lvc.edu",
          interests: ['community'],
          org: [1, 2, 3],
          password: "password",
          username: "ajl008", events: [],
        ),
        User(
          emailAddress: "yarnall@lvc.edu",
          interests: ['computers'],
          org: [3],
          password: "password",
          username: "yarnall", events: [],
        ),
      ];

      return users;
    } catch (e) {
      throw (e);
    }
  }
}
