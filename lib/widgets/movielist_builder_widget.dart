import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/movie_model.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/movie_card.dart';

class MovieListBuilder extends StatelessWidget {
  final ApiService movieApiService;
  final String apiUrl;

  const MovieListBuilder({
    Key? key,
    required this.movieApiService,
    required this.apiUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: movieApiService.getMovies(apiUrl: '${apiUrl}${ApiConstants().apiKey}'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No movies available.');
        } else {
          List<MovieModel> movies = snapshot.data!;
          return MovieCardWidget(movies: movies);
        }
      },
    );
  }
}
