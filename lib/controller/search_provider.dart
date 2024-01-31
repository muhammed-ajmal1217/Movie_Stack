import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/movie_model.dart';

import 'package:themovieapp/service/api_service.dart';

class SearchProvider extends ChangeNotifier {
  final TextEditingController queryController = TextEditingController();
  final ApiService apiService = ApiService();
  final ApiConstants apiConstants=ApiConstants();
  List<MovieModel> searchResults = [];
  void searchMovies(String query) async {
    // String query = queryController.text.trim();
    if (query.isNotEmpty) {
      try {
        final searchUrl =
            "${apiConstants.search}=$query&${apiConstants.apiKey}";
        List<MovieModel> movies =
            await apiService.searchMovie(searchurl: searchUrl);

        searchResults = movies;
        notifyListeners();
      } catch (e) {
        Exception(e);
      }
    } else {
      searchResults = [];
      notifyListeners();
    }
  }
}
