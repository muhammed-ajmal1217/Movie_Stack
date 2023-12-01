import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/model.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/movie_card.dart';

class UpComingMovies extends StatelessWidget {
   UpComingMovies({super.key});

  MovieApiService upComingMovie =MovieApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
            future: upComingMovie.getMovies(apiUrl: '${ApiConstants().upComing}${ApiConstants().apiKey}'),
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