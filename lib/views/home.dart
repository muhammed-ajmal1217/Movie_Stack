import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:themovieapp/helpers/movie_category_title.dart';
import 'package:themovieapp/helpers/spacing.dart';
import 'package:themovieapp/widgets/top_rated_movie_card.dart';
import 'package:themovieapp/widgets/upcoming_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
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
          )),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            spacingHeight(20),
            SizedBox(
              width: double.infinity,
              child: CarouselSlider.builder(
                  itemCount: 10,
                  options: CarouselOptions(
                    height: 250.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                  itemBuilder: (context, itemIndex, pageViewIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 300,
                        width: 400,
                        color: Colors.amber,
                      ),
                    );
                  }),
            ),
            spacingHeight(20),
            categoryTitle(text: 'Top Rated Movies'),
            TopRatedMovies(),
            spacingHeight(20),
            categoryTitle(text: 'Up Coming Movies'),
            UpComingMovies(),
          ],
        ),
      ),
    );
  }
}


