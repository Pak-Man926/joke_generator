import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class Joke {
  Joke({
    required this.id,
    required this.type,
    required this.setup,
    required this.punchline,
  });

  factory Joke.fromJson(Map<String, Object?> json)
  {
    return Joke(
      id: json['id']! as int,
      type: json['type']! as String,
      setup: json['setup']! as String,
      punchline: json['punchline']! as String,
    );
  }

  final String type;
  final String setup;
  final String punchline;
  final int id;
}

final dio = Dio();

Future<Joke> fetchRandomJoke() async
{
  final response = await dio.get<Map<String, Object?>>(
    "hhtps://official-joke-api.appspot.com/random_joke",
  );

  return Joke.fromJson(response.data!);
}


final randomJokeProvider = FutureProvider <Joke>((ref) async{

  return fetchRandomJoke();
});