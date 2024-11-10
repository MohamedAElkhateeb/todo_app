import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/utils/colors_manger.dart';

class LightAppStyle {
  static TextStyle appBar = GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.w700, color: ColorsManger.white);
  static TextStyle settingsTabLabel = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsManger.black,
  );
  static TextStyle settingsTabSelectedItem = GoogleFonts.inter(
    color: ColorsManger.blue,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bottomSheetTitle = GoogleFonts.inter(
    color: ColorsManger.blackAccent,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle hint = GoogleFonts.inter(
    color: ColorsManger.hint,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static TextStyle date = GoogleFonts.inter(
    color: ColorsManger.black,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle todoTitle = GoogleFonts.poppins(
    color: ColorsManger.blue,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static TextStyle todoDesc = GoogleFonts.roboto(
    color: ColorsManger.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ); static TextStyle calenderSelectedDate = GoogleFonts.roboto(
    color: ColorsManger.blue,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );static TextStyle calenderUnSelectedDate = GoogleFonts.roboto(
    color: ColorsManger.black,
    fontSize: 15,
    fontWeight: FontWeight.w700,
  );

}
