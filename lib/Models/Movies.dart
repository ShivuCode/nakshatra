import 'dart:convert';

class Movie {
  final int id;
  final String title;
  final List<String> actors;
  final List<String> directors;
  final int year;
  final String description;
  final int time;
  final String releasedDate;
  final List<String> writer;
  final String country;
  final List<String> language;
  final String award;
  final String type;
  final String poster;

  Movie({
    required this.id,
    required this.title,
    required this.actors,
    required this.directors,
    required this.year,
    required this.description,
    required this.time,
    required this.releasedDate,
    required this.writer,
    required this.country,
    required this.language,
    required this.award,
    required this.type,
    required this.poster,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'actors': actors,
      'directors': directors,
      'year': year,
      'description': description,
      'time': time,
      'releasedDate': releasedDate,
      'writer': writer,
      'country': country,
      'language': language,
      'award': award,
      'type': type,
      'poster': poster,
    };
  }

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      actors: (json['actors'] as String)
          .split(', '), // Split actors string into a list
      directors: (json['directors'] as String)
          .split(', '), // Split directors string into a list
      year: json['year'],
      description: json['description'],
      time: json['time'],
      releasedDate: json['releasedDate'],
      writer: (json['writer'] as String).split(', '),
      country: json['country'],
      language: (json['language'] as String).split(', '),
      award: json['award'],
      type: json['type'],
      poster: json['poster'],
    );
  }
}
