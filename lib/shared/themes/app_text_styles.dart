import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobcar/shared/themes/app_colors.dart';

class AppTextStyles {
  static final titleHome = GoogleFonts.roboto(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
  static final titleBlue = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.blue,
  );
  static final titleBoldBackground = GoogleFonts.roboto(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.whitePrimary,
  );
  static final titlenormalBlue = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.blue,
  );
  static final titleListTile = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    color: AppColors.grayPrimary,
  );
  static final normalTextPrimary = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: AppColors.primary,
  );
  static final normalTextSecoundary = GoogleFonts.roboto(
    fontSize: 17,
    fontWeight: FontWeight.normal,
    color: AppColors.graySecoundary,
  );
}
