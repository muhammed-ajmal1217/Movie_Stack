import 'package:flutter/material.dart';
import 'package:themovieapp/model/movie_model.dart';

import 'package:themovieapp/service/api_service.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController queryController = TextEditingController();
  final ApiService apiService = ApiService();
  List<MovieModel> searchResults = [];
  void searchMovies(String query) async {
    // String query = queryController.text.trim();
    if (query.isNotEmpty) {
      try {
        final searchUrl =
            "https://api.themoviedb.org/3/search/movie?query=$query&api_key=62993259b09bd60f498f3221ef24fe9c";
        List<MovieModel> movies =
            await apiService.searchMovie(searchurl: searchUrl);

        searchResults = movies;
        notifyListeners();
      } catch (e) {
        print("Error: $e");
      }
    } else {
      searchResults = [];
      notifyListeners();
    }
  }
}
