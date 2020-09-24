// import 'package:dio/dio.dart';

import 'package:dutchmenserve/models/event.dart';

class EventsRepository {
  // EventsRepository(this.client);

  // final Dio client;

  Future<List<Event>> getEvents() async {
    try {
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

      final data = await client.get();

      final events = List<Event>.of(
        data.map<Event>(
          (json) => Event(
            eventName: json['eventName'],
            date: json['date'],
            location: json['location'],
            description: json['description'],
            interests: json['interests'],
          ),
        ),
      );

      return events;
    } catch (e) {
      throw e;
    }
  }
}
