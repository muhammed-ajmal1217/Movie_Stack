

import 'package:dio/dio.dart';
import 'package:themovieapp/model/cast_model.dart';
import 'package:themovieapp/model/movie_model.dart';

class MovieApiService{
Dio dio=Dio();
Future<List<MovieModel>> getMovies({required var apiUrl}) async {
  var url= apiUrl;
  try {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      final Map<String,dynamic> jsonList = response.data;
      List<dynamic> movies = jsonList["results"];
     return  movies.map((json) {
        return MovieModel.fromJson(json);

      }).toList();
    
    } else {
      throw Exception('Failed to load movies');
    }
  } catch (error) {
    throw Exception('Failed to load Movies: $error');
  }
}
Future<List<CastModel>> getCasts({required var castsUrl}) async {
  var url= castsUrl;
  try {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      final Map<String,dynamic> jsonList = response.data;
      final List<dynamic> casts = jsonList["cast"];
     return  casts.map((json) {
        return CastModel.fromJson(json);
      }).toList();
    
    } else {
      throw Exception('Failed to load movies');
    }
  } catch (error) {
    throw Exception('Failed to load Movies: $error');
  }
}
Future<List<MovieModel>> getSimilarMovies({required var similarUrl}) async {
  var url= similarUrl;
  try {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      final Map<String,dynamic> jsonList = response.data;
      final List<dynamic> casts = jsonList["results"];
     return  casts.map((json) {
        return MovieModel.fromJson(json);
      }).toList();
    
    } else {
      throw Exception('Failed to load movies');
    }
  } catch (error) {
    throw Exception('Failed to load Movies: $error');
  }
}
  Future<List<MovieModel>> searchMovie({required searchurl}) async {
    try {
      final response = await dio.get(searchurl);
      if (response.statusCode == 200) {
        final Map<String, dynamic> searchdata = response.data;
        final List<dynamic> searchmovies = searchdata["results"];
        return searchmovies
            .map((search) => MovieModel.fromJson(search))
            .toList();
      } else {
        throw Exception('function error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}