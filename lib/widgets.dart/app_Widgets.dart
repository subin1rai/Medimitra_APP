import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppWidget {
  static TextStyle boldTextStyle() {
    return GoogleFonts.poppins(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);
  }

   static TextStyle HeadlineTextStyle() {
    return GoogleFonts.poppins(
        color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);
  }

   static TextStyle LightTextStyle() {
    return GoogleFonts.poppins(
        color: Colors.black38, fontSize: 15, fontWeight: FontWeight.w500);
  }

 static TextStyle semiTextStyle() {
    return GoogleFonts.poppins(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500);
  }

}
