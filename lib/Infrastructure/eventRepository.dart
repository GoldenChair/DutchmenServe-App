// import 'package:dio/dio.dart';

import 'package:dutchmenserve/models/event.dart';
import 'package:dutchmenserve/models/user.dart';

abstract class EventRepository {
  // Students want to see what events are available
  Future<List<Event>> getEvents();
  // Jen wants to see which students are registered for an event
  Future<List<User>> getRegistered(Event e);
  // someone wants to remove event(s)
  Future<void> removeEvents(List<Event> le);
  // someone wants to add event(s)
  Future<void> addEvents(List<Event> ae);
  // someone wants to edit an event's info
  Future<void> replaceEvent(Event olde, Event newe);
}

class FakeEventRepository implements EventRepository {
  // get list of all current service events
  @override
  Future<List<Event>> getEvents() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return [
          Event('AFCA', '9/28/2020 5:50 PM', 'here', '..', ['seniors'],
              imagePath: '/'),
          Event('AFCA', '9/28/2020 5:50 PM', 'here', '..', ['seniors'],
              imagePath: '/'),
          Event('AFCA', '9/28/2020 5:50 PM', 'here', '..', ['seniors'],
              imagePath: '/'),
        ];
      },
    );

    // final Dio client;
    // EventRepository(this.client);

    // final url =
    //     'https://api.themoviedb.org/3/trending/movie/week?api_key=060e7c76aff06a20ca4a875981216f3f';

    // final response = await client.get(url);

    // final events = List<Event>.of(
    //   response.data['results'].map<MovieModel>(
    //     (json) => MovieModel(
    //       title: json['title'],
    //       urlImage: 'https://image.tmdb.org/t/p/w185${json['poster_path']}',
    //     ),
    //   ),
    // );

    // final data = await client.get();

    // final events = List<Event>.of(
    //   data.map<Event>(
    //     (json) => Event(
    //       eventName: json['eventName'],
    //       date: json['date'],
    //       location: json['location'],
    //       description: json['description'],
    //       interests: json['interests'],
    //     ),
    //   ),
    // );
  }

  @override
  Future<List<User>> getRegistered(Event e) {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        User u = new User();
        u.setUsername("ajl008");
        u.setEmail();
        return [u, u, u];
      },
    );
  }

  @override
  Future<void> addEvents(List<Event> ae) {
    // TODO: implement addEvents
    return Future.delayed(
      Duration(seconds: 1),
      () {
        print("ADDED");
        for (int i = 0; i < ae.length; i++) {
          ae[i].printEvent();
        }
      },
    );
  }

  @override
  Future<void> removeEvents(List<Event> le) {
    // TODO: implement removeEvents
    return Future.delayed(
      Duration(seconds: 1),
      () {
        print("REMOVED");
        for (int i = 0; i < le.length; i++) {
          le[i].printEvent();
        }
      },
    );
  }

  @override
  Future<void> replaceEvent(Event olde, Event newe) {
    // TODO: implement replaceEvent
    return Future.delayed(
      Duration(seconds: 1),
      () {
        print("UPDATED EVENT");
        removeEvents([olde]);
        addEvents([newe]);
      },
    );
  }
}
