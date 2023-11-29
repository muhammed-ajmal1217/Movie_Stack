

import 'package:dio/dio.dart';
import 'package:themovieapp/model/model.dart';

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
}