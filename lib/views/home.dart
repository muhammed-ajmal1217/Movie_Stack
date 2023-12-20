import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/controller/home_provider.dart';
import 'package:themovieapp/helpers/colors.dart';
import 'package:themovieapp/helpers/texts.dart';
import 'package:themovieapp/helpers/spacing.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/carousal_widget.dart';
import 'package:themovieapp/widgets/movielist_builder_widget.dart';
import 'package:themovieapp/widgets/tvlist_builder_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).getMoviestoHome();
  }
  ApiService apiService=ApiService();
  ApiConstants apiConstants=ApiConstants();
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: backgroundGradient(),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacingHeight(height*0.05),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/video-play-4-24 (1).png'))),
                      ),
                    ),
                    Text(
                      'Movies_',
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white, fontSize: 25),
                    ),
                  ],
                ),
                spacingHeight(20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Trending Movies',
                    style:
                        GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                  ),
                ),
                spacingHeight(20),
                CarousalWidget(height: height, width: width),
                spacingHeight(10),

                categoryTitle(text: 'Top Rated Movies'),
                MovieListBuilder(movieApiService: apiService,apiUrl:apiConstants.topRated),
                spacingHeight(10),
                
                categoryTitle(text: 'Up Coming Movies'),
                MovieListBuilder(movieApiService: apiService, apiUrl: apiConstants.upComing),
                spacingHeight(10),
                
                categoryTitle(text: 'Popular Movies'),
                MovieListBuilder(movieApiService: apiService, apiUrl: apiConstants.popular),
                spacingHeight(10),
                
                categoryTitle(text: 'Top Rated TV Series List'),
                TvListBuilder(tvApiService: apiService, apiUrl: apiConstants.topRatedTvHome),
                spacingHeight(10),
                
                categoryTitle(text: 'On the Air Series List'),
                TvListBuilder(tvApiService: apiService, apiUrl: apiConstants.onTheAirtvHome),
              ],
            ),
          ),
        ));
  }
}




