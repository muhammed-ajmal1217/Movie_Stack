import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/model/model.dart';
import 'package:themovieapp/service/api_service.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Movies_',style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: MovieApiService().getMovies(apiUrl: 'https://api.themoviedb.org/3/trending/all/day?${ApiConstants().apiKey}'),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else if(snapshot.connectionState==ConnectionState.none){
            return Center(child: Text('No data available'),);
          }else{
            List <MovieModel> all= snapshot.data!;
            return ListView.builder(
              itemBuilder: (context,index){
                final data=all[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 59, 59, 59)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(image: NetworkImage('${ApiConstants().imageUrl}${data.posterPath!}'),
                          fit: BoxFit.cover
                          )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),

                    SizedBox(height: 20,),
                    Text(data.overview!,style: GoogleFonts.montserrat(color: Colors.white,fontSize: 20),),

                  ],
                ),
              );
            },
            itemCount: all.length,
            );
          }
        }
        )
    );
  }
}