import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/movie_model.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/tv_card_widget.dart';

class SimilarTvListBuilder extends StatelessWidget {
  final ApiService tvApi;
  final ApiConstants apiconst;
  final String? type;
  final int? id;
  const SimilarTvListBuilder({
    super.key,
    required this.tvApi,
    required this.apiconst,
    required this.type,
    required this.id,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:tvApi.getSimilarMovies(similarUrl: '${apiconst.base}/${type}/${id}${apiconst.similarMovieUrl}${apiconst.apiKey}'),
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
        return TvCardWidget( movies: similarMovie, );
      }
    });
  }
}