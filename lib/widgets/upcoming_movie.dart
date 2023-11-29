import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/helpers/spacing.dart';
import 'package:themovieapp/model/model.dart';
import 'package:themovieapp/service/api_service.dart';

class UpComingMovies extends StatefulWidget {
  const UpComingMovies({super.key});

  @override
  State<UpComingMovies> createState() => _UpComingMoviesState();
}

class _UpComingMoviesState extends State<UpComingMovies> {
  MovieApiService upComingMovie =MovieApiService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: upComingMovie.getMovies(apiUrl: '${ApiConstants().upComing}${ApiConstants().apiKey}'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No movies available.');
        } else {
          List<MovieModel> movies = snapshot.data!;
          return SizedBox(
            height: 300,
            width: double.infinity,
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                MovieModel movie = movies[index];       
                return Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 42, 42, 42),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: NetworkImage('${ApiConstants().imageUrl}${movie.posterPath}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width:200,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.grey[900]!.withOpacity(0.5),
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                 Text(movie.originalTitle??'No data vailable',style: GoogleFonts.poppins(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),),
                                 Text(movie.releaseDate??'No data vailable',style: GoogleFonts.poppins(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),),
                                  ],
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                    spacingWidth(20),
                  ],
                );
              },
            ),
          );
        }
      },
    );
  }
}