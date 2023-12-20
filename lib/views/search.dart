import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import 'package:provider/provider.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/controller/search_provider.dart';
import 'package:themovieapp/helpers/colors.dart';
import 'package:themovieapp/helpers/spacing.dart';
import 'package:themovieapp/views/details_page.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final search = Provider.of<SearchProvider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(gradient: backgroundGradient()),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                spacingHeight(40),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onChanged: (value) {
                      search.searchMovies(value);
                    },
                    controller: search.queryController,
                    decoration: InputDecoration(
                      helperStyle: TextStyle(color: Colors.white),
                      hintText: 'Search..',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelStyle: TextStyle(color: Colors.white), 
                      prefixIcon: const Icon(Iconsax.search_favorite),
                      fillColor: Colors.grey.withOpacity(0.5),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height,
                  child: search.searchResults.isEmpty
                      ? Padding(
                        padding: const EdgeInsets.only(top: 250),
                        child: Column(
                          children: [
                            Icon(Iconsax.search_favorite,size: 80,color: Colors.white.withOpacity(0.2),),
                            Text('Search..',style: GoogleFonts.lato(color: Colors.white.withOpacity(0.2),fontSize: 25),),
                          ],
                        ),
                      )
                      : GridView.builder(
                          itemCount: search.searchResults.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8,
                                  crossAxisCount: 3,
                                  childAspectRatio: 1 / 1.4),
                          itemBuilder: (context, index) {
                            final searchdata =
                                search.searchResults[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                          type: 'movie',
                                          backgroundImage:
                                              searchdata.posterPath,
                                          date: 
                                              searchdata.releasedate!,
                                          id: searchdata.id,
                                          name: searchdata.title,
                                          overview: searchdata.overview,
                                          voteraverage: searchdata.voteAverage,
                                          votercount: searchdata.voterCount,
                                        )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: carousalBackgroundColor(),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(1.2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${ApiConstants().imageUrl}${searchdata.posterPath}"),
                                            fit: BoxFit.fill,
                                            filterQuality: FilterQuality.high),
                                        color: Color.fromARGB(255, 2, 11, 49),
                                        borderRadius: BorderRadius.circular(19)),
                                  ),
                                ),
                              ),
                            );
                          }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
