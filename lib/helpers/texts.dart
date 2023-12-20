import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Align categoryTitle({required String text}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: SizedBox(
          height: 50,
          child: Text(
            text,
            style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
          )),
    ),
  );
}
  Text splashTexts({String? text, double? fontSize}) {
    return Text(text!,style: GoogleFonts.montserrat(
                              color: Colors.white, fontSize: fontSize,fontWeight: FontWeight.w300),);
  }