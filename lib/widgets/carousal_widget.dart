import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/controller/home_provider.dart';
import 'package:themovieapp/helpers/colors.dart';
import 'package:themovieapp/model/movie_model.dart';
import 'package:themovieapp/views/details_page.dart';

class CarousalWidget extends StatelessWidget {
  const CarousalWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, homeProvider, child) => SizedBox(
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: homeProvider.movies!.length,
          options: CarouselOptions(
            height: height*0.43,
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => DetailsPage(
                          type: "movie",
                            backgroundImage: movie.posterPath!,
                            name: movie.title!,
                            id: movie.id,
                            overview: movie.overview!,
                            voteraverage: movie.voteAverage,
                            votercount: movie.voterCount,
                            date: movie.releasedate!,
    
                            )));
                  },
                  child: Container(
                    width: width*0.78,
                    decoration: BoxDecoration(
                      gradient: carousalBackgroundColor(),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(15),
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
    );
  }
}