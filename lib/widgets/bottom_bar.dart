import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:themovieapp/views/main_pages/tv_shows_page.dart';
import 'package:themovieapp/views/main_pages/home.dart';
import 'package:themovieapp/views/main_pages/movies.dart';
import 'package:themovieapp/views/main_pages/search.dart';
class BottomBarExample extends StatefulWidget {
  @override
  _BottomBarExampleState createState() => _BottomBarExampleState();
}

class _BottomBarExampleState extends State<BottomBarExample> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    Search(),
    MovieList(),
    TvShowsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 4, 2, 17),
      body: _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container( 
            child: NavigationBar(
              backgroundColor:  Color.fromARGB(255, 4, 2, 17),
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              destinations: [
                NavigationDestination(
                  icon: Icon(Iconsax.home,
                      color: _currentIndex == 0 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.search_normal,
                      color: _currentIndex == 1 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
                  label: 'Search',
                  
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.video,
                      color: _currentIndex == 2 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
                  label: 'Movies',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.video_horizontal,
                      color: _currentIndex == 3 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
                  label: 'TV',

                ),
              ],
              indicatorColor: Color.fromARGB(255, 33, 143, 149),
              surfaceTintColor:  Color.fromARGB(255, 4, 2, 17),
            ),
          ),
        ),
      ),
    );
  }
}
