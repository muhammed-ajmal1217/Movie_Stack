import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/helpers/colors.dart';
import 'package:themovieapp/model/cast_model.dart';

class CastCardWidget extends StatelessWidget {
  const CastCardWidget({
    super.key,
    required this.cast,
  });

  final List<CastModel> cast;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: ListView.builder(
        itemCount: cast.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          CastModel casts = cast[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: carousalBackgroundColor(),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: 45,
                        foregroundImage: NetworkImage(
                            '${ApiConstants().imageUrl}${casts.profilePath}'),
                      ),
                    ),
                  ),
                ),
                Text(casts.name!, style: GoogleFonts.abel(color: Colors.white)),
              ],
            ),
          );
        },
      ),
    );
  }
}
