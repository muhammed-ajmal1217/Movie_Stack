import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/model.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/movie_card.dart';

class TopRatedTv extends StatelessWidget {
   TopRatedTv({super.key});
  MovieApiService movieApiService =MovieApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
            future: movieApiService.getMovies(apiUrl: '${ApiConstants().topRatedTv}${ApiConstants().apiKey}'),
            builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No movies available.');
            } else {
              List<MovieModel> topRatedTvShows = snapshot.data!;
              return MovieCardWidget(movies: topRatedTvShows);
            }
      },
    );
  }
}