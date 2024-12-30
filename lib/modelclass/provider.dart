import 'package:flutter/foundation.dart';

class Favmovies extends ChangeNotifier {
  final List<Movie> _favmovie = [];

  List<Movie> get favmovie => _favmovie;

  void addMovie(Movie movie) {
    _favmovie.add(movie);
    notifyListeners();
  }

  void removeMovie(Movie movie) {
    _favmovie.remove(movie);
    notifyListeners();
  }
}

class Movie {
  final String title;
  final String posturl;

  Movie({required this.title, required this.posturl});
}
