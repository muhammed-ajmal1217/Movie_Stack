import 'package:flutter/material.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/helpers/colors.dart';

class DetailsPage extends StatelessWidget {
  String? name;
  dynamic details;
  dynamic backgroundImage;
  String? overview;
  DetailsPage(
      {super.key,
      this.name,
      this.details,
      this.backgroundImage,
      this.overview});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: backgroundGradient()),
        child: Column(
          children: [
            Container(
              height: height*0.52,
              child: Stack(
                children: [
                  Container(
                    height: height * 0.38,
                    width: width * 1.20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                '${ApiConstants().imageUrl}${backgroundImage!}'),
                            fit: BoxFit.cover)),
                    
                  ),
                  Positioned(
                    top: 180,
                    child:Container(
                      width: width,
                      height: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                          colors: [
                            Color.fromARGB(255, 24, 24, 24)
                                .withOpacity(0.01),
                             Color.fromARGB(255, 24, 24, 24)
                                .withOpacity(0.3),
                             Color.fromARGB(255, 7, 5, 60)
                                .withOpacity(0.6),
                            Color.fromARGB(255, 3, 3, 49).withOpacity(0.9),
                            Color.fromARGB(255, 8, 3, 43), 
                          ],
                        ),
                      ),
                    ), 
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
