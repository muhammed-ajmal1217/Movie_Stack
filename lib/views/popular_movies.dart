import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/model.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/movie_card.dart';

class PopularMovies extends StatelessWidget {
   PopularMovies({super.key});

  MovieApiService popularMovies=MovieApiService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future:popularMovies.getMovies(apiUrl:'${ApiConstants().popular}${ApiConstants().apiKey}' ) , 
    builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }else if(snapshot.hasError){
        return Center(child: Text('Error${snapshot.error}'));
      }else if(!snapshot.hasData || snapshot.data!.isEmpty){
        return Center(child: Text('Data is not Available'),);
      }else{
        List<MovieModel> movies = snapshot.data!;
        return MovieCardWidget(movies: movies);
      }
    });
  }
}