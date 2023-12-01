import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/model.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/tv_card_widget.dart';

class OnTheAirPageTv extends StatelessWidget {
   OnTheAirPageTv({super.key});
  MovieApiService ontheAir=MovieApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
            future: ontheAir.getMovies(apiUrl: '${ApiConstants().onAirTVList}${ApiConstants().apiKey}'),
            builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Text('No movies available.');
            } else {
              List<MovieModel> onTheAirList = snapshot.data!;
              return TvCardWidget(movies: onTheAirList);
            }
      },
    );
  }
}