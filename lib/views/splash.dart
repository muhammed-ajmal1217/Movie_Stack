import 'package:flutter/material.dart';
import 'package:themovieapp/helpers/colors.dart';
import 'package:themovieapp/helpers/spacing.dart';
import 'package:themovieapp/helpers/texts.dart';
import 'package:themovieapp/widgets/bottom_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 2, 6, 48),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(image: DecorationImage(
              image: AssetImage('assets/splash4.jpg'),
              fit: BoxFit.cover,
              ),),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                const Color.fromARGB(255, 2, 6, 48).withOpacity(0.5),
                const Color.fromARGB(255, 2, 6, 48).withOpacity(0.9),
                const Color.fromARGB(255, 2, 6, 48)
              ])
            ),
          ),
          Positioned(
            top: 530,
            child: Column(
              children: [
                      splashTexts(text: 'Movie Stack',fontSize: 25),
                      spacingHeight(5),
                      splashTexts(text: 'Dive into a world of cinematic wonders',fontSize: 15),
                      splashTexts(text: 'Explore, Discover, and Experience the',fontSize: 13),
                      splashTexts(text: 'magic of movies with our app',fontSize: 13),
                      splashTexts(text: 'Your gateway to a reel adventure awaits!',fontSize: 13),
                      spacingHeight(25),
                      Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        gradient: carousalBackgroundColor()
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(1.2),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 2, 6, 48).withOpacity(0.8),
                            ),
                            child: Center(child: splashTexts(text: 'Lets Start',fontSize: 15),),
                            ),
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>BottomNavigation()));
                            },
                          ),
                        ),
                      )
              ],
            ),
          ),
        ],
      ),
    );
  }


}