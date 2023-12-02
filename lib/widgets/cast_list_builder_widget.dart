import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/cast_model.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/cast_card.dart';

class CastListBuilderWidget extends StatelessWidget {
  const CastListBuilderWidget({
    super.key,
    required this.apiconst,
    required this.type,
    required this.id,
  });

  final ApiConstants apiconst;
  final String? type;
  final int? id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MovieApiService().getCasts(
            castsUrl:
                '${apiconst.base}/${type}/${id}${apiconst.castendPoint}${apiconst.apiKey}'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Data is not Available'),
            );
          } else {
            List<CastModel> cast = snapshot.data!;
            return CastCardWidget(cast: cast);
          }
        });
  }
}