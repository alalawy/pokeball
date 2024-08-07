import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  TextStyle title1() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 48,
      height: 1.56,
    );
  }

  TextStyle title2() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 32,
      height: 1.36,
    );
  }

  TextStyle title3() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      height: 1.32,
    );
  }

  TextStyle tinyTightRegular() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      height: 1.20,
    );
  }

  TextStyle regularTightRegular() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      height: 1.20,
    );
  }

  TextStyle regularTightBold() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      height: 1.20,
    );
  }

  TextStyle regularNoneRegular() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      height: 1,
    );
  }

  TextStyle largeNoneRegular() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      height: 1,
    );
  }

  TextStyle regularNoneMedium() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1,
    );
  }

  TextStyle regularNoneBold() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.bold,
      fontSize: 16,
      height: 1,
    );
  }

  TextStyle regularNoneSuperBold() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w900,
      fontSize: 16,
      height: 1,
    );
  }

  TextStyle regularNormalRegular() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      height: 1.5,
    );
  }

  TextStyle smallNormalRegular() {
    return GoogleFonts.inter(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      height: 1.42,
    );
  }
}
