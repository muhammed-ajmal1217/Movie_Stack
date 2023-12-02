import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/helpers/colors.dart';
import 'package:themovieapp/helpers/movie_category_title.dart';
import 'package:themovieapp/helpers/spacing.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/tvlist_builder_widget.dart';

class TvShowsPage extends StatelessWidget {
   TvShowsPage({super.key});
  MovieApiService movieApiService=MovieApiService();
  ApiConstants apiConstants=ApiConstants();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: backgroundGradient()
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacingHeight(50),
                categoryTitle(text: 'Trending Tv Shows'),
                spacingHeight(20),
                TvListBuilder(movieApiService: movieApiService, apiUrl: apiConstants.tvList),
                spacingHeight(20),
                categoryTitle(text: 'On The Air Now'),
                TvListBuilder(movieApiService: movieApiService,apiUrl: apiConstants.onAirTVList),
                spacingHeight(20),
                categoryTitle(text: 'Popular Tv Shows'),
                TvListBuilder(movieApiService: movieApiService, apiUrl: apiConstants.popularTvSeriesTv)
              ],
            ),
          ),
        ));
  }
}


