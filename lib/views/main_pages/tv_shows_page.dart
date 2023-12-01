import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/helpers/colors.dart';
import 'package:themovieapp/helpers/movie_category_title.dart';
import 'package:themovieapp/helpers/spacing.dart';
import 'package:themovieapp/model/model.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/views/tv_page/airing_today_tv.dart';
import 'package:themovieapp/views/tv_page/popular_tv_shows.dart';
import 'package:themovieapp/widgets/tv_card_widget.dart';

class TvShowsPage extends StatelessWidget {
  const TvShowsPage({super.key});

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
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text('Trending Tv Shows',style: GoogleFonts.aBeeZee(
                            color: Colors.white, fontSize: 20),),
                ),
                          spacingHeight(20),
                FutureBuilder<List<MovieModel>>(
                  future: MovieApiService().getMovies(
                      apiUrl: '${ApiConstants().tvList}${ApiConstants().apiKey}'),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      print('Snapshot data is empty or null: ${snapshot.data}');
                      return Center(child: Text('Data is not available'));
                    } else if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return Center(child: Text('Error ${snapshot.error}'));
                    } else {
                      List<MovieModel> tv = snapshot.data!;
                      return Align(
                        alignment: Alignment.topCenter,
                        child: TvCardWidget(
                          movies: tv),
                      );
                    }
                  },
                ),
                spacingHeight(20),
                categoryTitle(text: 'On The Air Now'),
                OnTheAirPageTv(),
                spacingHeight(20),
                categoryTitle(text: 'Popular Tv Shows'),
                PopularTvshowTv()
              ],
            ),
          ),
        ));
  }
}
