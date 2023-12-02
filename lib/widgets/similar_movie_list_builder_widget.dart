import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/movie_model.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/movie_card.dart';

class SimilarMovieListBuilder extends StatelessWidget {
  const SimilarMovieListBuilder({
    super.key,
    required this.movieApi,
    required this.apiconst,
    required this.type,
    required this.id,
  });

  final MovieApiService movieApi;
  final ApiConstants apiconst;
  final String? type;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:movieApi.getSimilarMovies(similarUrl: '${apiconst.base}/${type}/${id}${apiconst.similarMovieUrl}${apiconst.apiKey}'),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Center(child: Text('Error${snapshot.error}'));
      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
        return Center(
          child: Text('Data is not Available'),
        );
      } else {
        List<MovieModel> similarMovie = snapshot.data!;
        return MovieCardWidget( movies: similarMovie, );
      }
    });
  }
}