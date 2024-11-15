import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/utils/colors_manger.dart';

class LightAppStyle {
  static TextStyle taskItemDescription = GoogleFonts.poppins(
    color: ColorsManger.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
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
  static TextStyle authHint = GoogleFonts.roboto(
      fontSize: 13,
      fontWeight: FontWeight.w300,
      color: ColorsManger.fieldBlack);
  static TextStyle authTitle = GoogleFonts.roboto(
      fontSize: 18, fontWeight: FontWeight.w500, color: ColorsManger.white);
  static TextStyle authButton = GoogleFonts.roboto(
      fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue.shade900);
  static TextStyle textFieldHint = GoogleFonts.inter(
    color: ColorsManger.hint,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle editingTaskTitle = GoogleFonts.poppins(
    color: ColorsManger.black,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle haveAccount = GoogleFonts.poppins(
    color: ColorsManger.white,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
  );
  static TextStyle controller = GoogleFonts.poppins(
    color: ColorsManger.black,
    fontSize: 18.sp,
  );
  static TextStyle saveButton = GoogleFonts.inter(
      fontSize: 18, fontWeight: FontWeight.w400, color: ColorsManger.white);
}
class DarkAppStyle {
  static TextStyle appBar = GoogleFonts.poppins(
    fontSize: 22.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManger.darkScaffoldBg,
  );
  static TextStyle settingsTabLabel = GoogleFonts.poppins(
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: ColorsManger.white,
  );
  static TextStyle settingsTabSelectedItem = GoogleFonts.inter(
    color: ColorsManger.blue,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle bottomSheetTitle = GoogleFonts.poppins(
    color: ColorsManger.white,
    fontWeight: FontWeight.w700,
    fontSize: 18.sp,
  );
  static TextStyle hint = GoogleFonts.inter(
    color: ColorsManger.hint,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle date = GoogleFonts.inter(
    color: ColorsManger.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle todoTitle = GoogleFonts.poppins(
    color: ColorsManger.blue,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle todoDesc = GoogleFonts.poppins(
    color: ColorsManger.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle calenderSelectedDate = GoogleFonts.roboto(
      fontSize: 16.sp, fontWeight: FontWeight.w700, color: ColorsManger.blue);
  static TextStyle calenderUnSelectedDate = GoogleFonts.roboto(
      fontSize: 16.sp, fontWeight: FontWeight.w700, color: ColorsManger.white);
  static TextStyle editingTaskTitle = GoogleFonts.poppins(
    color: ColorsManger.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
  static TextStyle authHint = GoogleFonts.poppins(
    color: ColorsManger.black.withOpacity(.7),
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
  );
  static TextStyle authTitle = GoogleFonts.poppins(
    color: ColorsManger.white,
    fontWeight: FontWeight.w600,
    fontSize: 18.sp,
  );
  static TextStyle authButton = GoogleFonts.poppins(
    color: ColorsManger.black,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );
  static TextStyle haveAccount = GoogleFonts.poppins(
    color: ColorsManger.white,
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
  );
  static TextStyle controller = GoogleFonts.poppins(
    color: ColorsManger.white,
  );
  static TextStyle saveButton = GoogleFonts.inter(
      fontSize: 18, fontWeight: FontWeight.w400, color: ColorsManger.white);
static TextStyle textFieldHint = GoogleFonts.inter(
      fontSize: 18, fontWeight: FontWeight.w400, color: ColorsManger.white);
  static TextStyle taskItemDescription = GoogleFonts.poppins(
    color: ColorsManger.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
}


