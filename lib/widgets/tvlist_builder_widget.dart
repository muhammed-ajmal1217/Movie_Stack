import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/movie_model.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/tv_card_widget.dart';

class TvListBuilder extends StatelessWidget {
  final ApiService tvApiService;
  final String apiUrl;
  const TvListBuilder({
    super.key,
    required this.tvApiService,
    required this.apiUrl,
  });


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
                future: tvApiService.getMovies(apiUrl: '${apiUrl}${ApiConstants().apiKey}'),
                builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No Tv Series Available');
                } else {
                  List<MovieModel> onTheAirList = snapshot.data!;
                  return TvCardWidget(movies: onTheAirList);
                }
          },
        );
  }
}