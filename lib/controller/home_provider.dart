import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/model.dart';
import 'package:themovieapp/service/api_service.dart';

class HomeProvider extends ChangeNotifier{
  final MovieApiService movieApiService = MovieApiService();
    List<MovieModel>? movies = [];
    Future<void> getMoviestoHome() async {
    try {
      List<MovieModel> movieResults = await movieApiService.getMovies(apiUrl: "${ApiConstants().trending}${ApiConstants().apiKey}");
        movies = movieResults;
    } catch (error) {
      print('Error fetching movies: $error');
    }
    notifyListeners();
  }
}