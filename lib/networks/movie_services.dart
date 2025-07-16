import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart';

import '../models/movie.dart';

class MovieServices {
  static final String _apiKey = "b6089aedb1274752de2f1022865a15ac";

  static Future<List<Movie>> fetchMovies() async {
    Uri uri = Uri.parse(
      "https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey",
    );
    final response = await get(uri);
    if (response.statusCode != 200) throw Exception("Failed to fetch movies");
    final rawData = jsonDecode(response.body) as Map<String, dynamic>;
    final List results = rawData["results"];

    final futures = results.map<Future<Movie>>((movie) async {
      final movieId = movie["id"];
      final detailUri = Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId?api_key=$_apiKey",
      );
      final detailRes = await get(detailUri);
      if (detailRes.statusCode == 200) {
        return Movie.fromJson(jsonDecode(detailRes.body));
      } else {
        throw Exception("Failed to fetch movie id $movieId");
      }
    }).toList();
    return await Future.wait(futures);
  }

  static Future<List<Movie>> fetchRandomMovies() async {
    final random = Random();
    final randomPage = random.nextInt(500) + 1; // TMDb hỗ trợ đến 500 trang

    final uri = Uri.parse(
      "https://api.themoviedb.org/3/movie/top_rated?api_key=$_apiKey&page=$randomPage",
    );

    final response = await get(uri);
    if (response.statusCode != 200) throw Exception("Failed to fetch random movie list");

    final rawData = jsonDecode(response.body) as Map<String, dynamic>;
    final List results = rawData["results"];

    final futures = results.map<Future<Movie>>((movie) async {
      final movieId = movie["id"];
      final detailUri = Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId?api_key=$_apiKey",
      );
      final detailRes = await get(detailUri);
      if (detailRes.statusCode == 200) {
        return Movie.fromJson(jsonDecode(detailRes.body));
      } else {
        throw Exception("Failed to fetch movie id $movieId");
      }
    }).toList();

    return await Future.wait(futures);
  }


  static Future<Movie> fetchMovie(int id) async{
    Uri uri = Uri.parse(
      "https://api.themoviedb.org/3/movie/$id?api_key=$_apiKey",
    );
    final response = await get(uri);
    if (response.statusCode != 200) throw Exception("Failed to fetch movies");
    return Movie.fromJson(jsonDecode(response.body));
  }
}