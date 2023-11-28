import 'package:flutter/material.dart';
import 'package:themovieapp/helpers/spacing.dart';

class TopRatedMovies extends StatelessWidget {
  const TopRatedMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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