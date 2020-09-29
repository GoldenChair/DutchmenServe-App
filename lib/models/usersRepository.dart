import 'package:dutchmenserve/models/user.dart';

class userRepository {
  Future<List<User>> getUsers() async {
    try {
      final users = [
        User(
          emailAddress: "mjs016@lvc.edu",
          interests: ['animals'],
          org: [1],
          password: "password",
          username: "mjs016",
        ),
        User(
          emailAddress: "ajl008@lvc.edu",
          interests: ['community'],
          org: [1, 2, 3],
          password: "password",
          username: "ajl008",
        ),
        User(
          emailAddress: "yarnall@lvc.edu",
          interests: ['computers'],
          org: [3],
          password: "password",
          username: "yarnall",
        ),
      ];

      return users;
    } catch (e) {
      throw (e);
    }
  }
}
