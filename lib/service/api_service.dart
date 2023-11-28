import 'package:dio/dio.dart';
import 'package:themovieapp/model/model.dart';

class MovieApiService{
  Dio dio=Dio();
  var url=
"https://api.themoviedb.org/3/trending/movie/day?api_key=d6c9bd1d97608f2393f83c60eede8023";

  Future<List<MovieModel>>getMovies()async{
    try{
      Response response = await dio.get(url);
      if(response.statusCode==200){
         var jsonList = response.data as List;
        List<MovieModel> movies = jsonList.map((json) {
          return MovieModel.fromJson(json);
        }).toList();
        print(response.statusCode);

        return movies;
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      throw Exception('Failed to load Movies: $error');
    }
  }
}