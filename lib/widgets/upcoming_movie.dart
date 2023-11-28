import 'package:flutter/material.dart';
import 'package:themovieapp/helpers/spacing.dart';

class UpComingMovies extends StatefulWidget {
  const UpComingMovies({super.key});

  @override
  State<UpComingMovies> createState() => _UpComingMoviesState();
}

class _UpComingMoviesState extends State<UpComingMovies> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 300,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
              ),
              spacingWidth(20)
            ],
          );
        },
      ),
    );
  }
}