import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:themovieapp/controller/bottom_bar_provider.dart';
import 'package:themovieapp/views/tv_shows_page.dart';
import 'package:themovieapp/views/home.dart';
import 'package:themovieapp/views/movies.dart';
import 'package:themovieapp/views/search.dart';
class BottomNavigation extends StatelessWidget {
  final List<Widget> _pages = [
    HomePage(),
    SearchScreen(),
    MovieList(),
    TvShowsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider=Provider.of<BottomBarProvider>(context);
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 4, 2, 17),
      body: _pages[bottomProvider.currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container( 
            child: NavigationBar(
              backgroundColor:  Color.fromARGB(255, 4, 2, 17),
              selectedIndex: bottomProvider.currentIndex,
              onDestinationSelected: (index) {
                bottomProvider.navigatePage(index);
              },
              destinations: [
                NavigationDestination(
                  icon: Icon(Iconsax.home,
                      color:  bottomProvider.currentIndex == 0 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.search_normal,
                      color:  bottomProvider.currentIndex == 1 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
                  label: 'Search',
                  
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.video,
                      color:  bottomProvider.currentIndex == 2 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
                  label: 'Movies',
                ),
                NavigationDestination(
                  icon: Icon(Iconsax.video_horizontal,
                      color:  bottomProvider.currentIndex == 3 ? Colors.white : const Color.fromARGB(255, 106, 105, 105)),
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
