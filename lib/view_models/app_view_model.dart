import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/networks/movie_services.dart';

class AppViewModel extends ChangeNotifier {
  int? _selectedMovieId;
  int get selectedMovieId => _selectedMovieId!;
  void setSelectedMovieId(int id) {
    _selectedMovieId = id;
    notifyListeners();
  }

  Future<Movie> fetchMovie(int id) async {
    return await MovieServices.fetchMovie(id);
  }
}
