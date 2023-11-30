import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/controller/home_provider.dart';
import 'package:themovieapp/helpers/movie_category_title.dart';
import 'package:themovieapp/helpers/spacing.dart';
import 'package:themovieapp/views/popular_movies.dart';
import 'package:themovieapp/views/toprated_tv.dart';
import 'package:themovieapp/views/top_rated.dart';
import 'package:themovieapp/views/tv_shows.dart';
import 'package:themovieapp/views/upcoming_movie.dart';
import 'package:themovieapp/model/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context,listen: false).getMoviestoHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.transparent,
    body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 49, 7, 46), 
            Color.fromARGB(255, 2, 6, 24), 
            Color.fromARGB(255, 4, 9, 34), 
            ],
        ),),
        child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
            spacingHeight(40),
            Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/video-play-4-24 (1).png'))),
              ),
            ),
            Text(
              'Movies_',
              style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
            ),
          ],
        ),
            spacingHeight(20),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Trending Movies',
                style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
              ),
            ),
            spacingHeight(20),
            Consumer<HomeProvider>(
              builder: (context,homeProvider,child)=>
               SizedBox(
                width: double.infinity,
                child: CarouselSlider.builder(
                  itemCount: homeProvider.movies!.length,
                  options: CarouselOptions(
                    height: 350.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  disableGesture: true,
                  itemBuilder: (context, itemIndex, pageViewIndex) {
                    if (homeProvider.movies != null &&
                        homeProvider.movies!.isNotEmpty &&
                        itemIndex < homeProvider.movies!.length) {
                      MovieModel movie = homeProvider.movies![itemIndex];
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: 400,
                          color: Color.fromARGB(255, 50, 50, 50),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${ApiConstants().imageUrl}${movie.posterPath}'),
                                          fit: BoxFit.fill)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    movie.title ?? 'No data is available',
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: 300,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 42, 42, 42),
                        ),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                  },
                ),
              ),
            ),
            spacingHeight(10),
            categoryTitle(text: 'Top Rated Movies'),
            TopRated(),
            spacingHeight(10),
            categoryTitle(text: 'Up Coming Movies'),
            UpComingMovies(),
            spacingHeight(10),
            categoryTitle(text: 'Popular Movies'),
            PopularMovies(),
            spacingHeight(10),
            categoryTitle(text: 'Top Rated TV Series List'),
            TopRatedTv(),
            spacingHeight(10),
            categoryTitle(text: 'On the Air Series List'),
            OnTheAirPage(),
          ],
        ),
      ),
    ));
  }
}
