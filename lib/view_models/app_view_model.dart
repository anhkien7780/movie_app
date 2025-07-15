import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/networks/movie_services.dart';

class AppViewModel extends ChangeNotifier {

  List<Movie> _movies = <Movie>[];
  Movie? _selectedMovie;

  Future<void> fetchMovieData() async {
    try {
      _movies = await MovieServices.fetchMovie();
      notifyListeners();
    } catch (e) {
      throw Exception("Fetch movie failed $e");
    }
  }

  List<Movie> get movies => _movies;

  void setSelectedMovie(Movie movie) {
    _selectedMovie = movie;
  }

  Movie getSelectedMovie() {
    if (_selectedMovie != null) {
      return _selectedMovie!;
    }
    throw Exception("_selected movie is null");
  }
}
