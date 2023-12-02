import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/helpers/colors.dart';
import 'package:themovieapp/helpers/spacing.dart';
import 'package:themovieapp/model/movie_model.dart';
import 'package:themovieapp/service/api_service.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
            gradient: backgroundGradient(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                spacingHeight(50),
                Text(
                  'All Movies_',
                  style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
                ),
                Expanded(
                  child: FutureBuilder(
                      future: MovieApiService().getMovies(
                          apiUrl:
                              '${ApiConstants().popular}${ApiConstants().apiKey}'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.none) {
                          return Center(
                            child: Text('No data available'),
                          );
                        } else {
                          List<MovieModel> all = snapshot.data!;
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              final data = all[index];
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: carousalBackgroundColor()
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.1),
                                      child: Container(
                                        height: height*0.18,
                                        width: width*0.27,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(14),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                '${ApiConstants().imageUrl}${data.posterPath!}'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  spacingWidth(20),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data.title!}',
                                            style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          spacingHeight(10),
                                          RatingBarIndicator(
                                            itemBuilder: (context, index) {
                                              return Icon(
                                                Iconsax.star,
                                                color: Colors.amber,
                                              );
                                            },
                                            itemCount: 5,
                                            itemSize: 12,
                                            rating: data.voteAverage! / 2,
                                            unratedColor:
                                                Color.fromARGB(255, 78, 78, 78),
                                          ),
                                          spacingHeight(10),
                                          Text(
                                            "Release date : ${data.releasedate}",
                                            style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          spacingHeight(10),
                                          Text(
                                            "Language : ${data.originalLanguage}",
                                            style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          spacingHeight(10),
                                          Text(
                                            "Popularity : ${data.popularity}",
                                            style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: all.length,
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.white,
                                thickness: 0.2,
                              );
                            },
                          );
                        }
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
