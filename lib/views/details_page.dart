import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovieapp/constants/secret.dart';
import 'package:themovieapp/helpers/colors.dart';
import 'package:intl/intl.dart';
import 'package:themovieapp/helpers/spacing.dart';
import 'package:themovieapp/service/api_service.dart';
import 'package:themovieapp/widgets/cast_list_builder_widget.dart';
import 'package:themovieapp/widgets/similar_movie_list_builder_widget.dart';
import 'package:themovieapp/widgets/similar_tv_list_builder_widget.dart';

// ignore: must_be_immutable
class DetailsPage extends StatelessWidget {
  String? type;
  String? name;
  dynamic backgroundImage;
  String? overview;
  String? date;
  double? voteraverage;
  int? votercount;
  int? id;

  DetailsPage(
      {super.key,
      required this.type,
      this.name,
      this.backgroundImage,
      this.overview,
      this.date,
      this.voteraverage,
      this.votercount,
      this.id});

  ApiConstants apiconst = ApiConstants();
  ApiService movieApi = ApiService();
  
  @override
  Widget build(BuildContext context) {
    DateTime? releaseDate;

    if (date != null) {
      try {
        releaseDate = DateTime.parse(date!);
      } catch (e) {
        releaseDate = null;
      }
    } else {
      releaseDate = DateTime(0000, 0, 00);
    }

    String formattedDate = releaseDate  != null
        ? DateFormat('yyyy').format(releaseDate)
        : 'Date Not Available';

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(gradient: backgroundGradient()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height * 0.52,
                child: Stack(
                  children: [
                    Container(
                      height: height * 0.43,
                      width: width * 1.20,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  '${apiconst.imageUrl}${backgroundImage!}'),
                              fit: BoxFit.cover)),
                    ),
                    Positioned(
                      top: height * 0.21,
                      child: Container(
                        width: width,
                        height: 190,
                        decoration: BoxDecoration(
                          gradient: detailsPageBlurr(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.42,
                      left: width * 0.02,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name!,
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                            spacingWidth(10),
                            Text(
                              '(${formattedDate})',
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: height * 0.37,
                      right: width * 0.03,
                      child: Column(
                        children: [
                          RatingBarIndicator(
                            itemBuilder: (context, index) {
                              return Icon(
                                Icons.star,
                                color: Colors.amber,
                              );
                            },
                            itemCount: 5,
                            itemSize: 18,
                            rating: voteraverage! / 2,
                            unratedColor: Color.fromARGB(255, 78, 78, 78),
                          ),
                          Text(
                            'From ${votercount} users',
                            style: GoogleFonts.montserrat(
                                color: Colors.white, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: height * 0.070,
                      left: width * 0.05,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Color.fromARGB(255, 132, 131, 131)
                              .withOpacity(0.4),
                          child: Icon(
                            Icons.arrow_back,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Overview :',
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 16)),
                    spacingHeight(10),
                    Text(overview!,
                        style: GoogleFonts.montserrat(color: Colors.white)),
                  ],
                ),
              ),
              spacingHeight(10),
              CastListBuilderWidget(apiconst: apiconst, type: type, id: id),
              spacingHeight(10),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Similar Movies',
                        style: GoogleFonts.montserrat(
                            color: Colors.white, fontSize: 16)),
                    spacingHeight(10),
                    navigateTodetails(),
                    // SimilarMovieListBuilder(
                    //     movieApi: movieApi,
                    //     apiconst: apiconst,
                    //     type: type,
                    //     id: id)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  navigateTodetails(){
    if(type=='movie'){
      return SimilarMovieListBuilder(
                        movieApi: movieApi,
                        apiconst: apiconst,
                        type: type,
                        id: id);
    }else if(type=='tv'){
      return SimilarTvListBuilder(tvApi: movieApi, apiconst: apiconst, type: type, id: id);
    }else{
      throw Exception('Data is not Available');
    }
  }
}
