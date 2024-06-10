// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



/// Copied from _M3Typography abstract final class 
/// combined textThemes of EnglishLike and White MountatinView
/// Theme out of the full Typography class file. And of 
/// course substituting the Google font declations.
///
/// @author Fredrick Allan Grott
TextTheme appDarkTextTheme = TextTheme(
  displayLarge: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike displayLarge 2021', inherit: false, color: Colors.white54, fontSize: 57.0, fontWeight: FontWeight.w400, letterSpacing: -0.25, height: 1.12, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
   displayMedium: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike displayMedium 2021', inherit: false, color: Colors.white54, fontSize: 45.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.16, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    displaySmall: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike displaySmall 2021', inherit: false, color: Colors.white54, fontSize: 36.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.22, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    headlineLarge: GoogleFonts.rubik(textStyle: const  TextStyle(debugLabel: 'englishLike headlineLarge 2021', inherit: false, color: Colors.white54, fontSize: 32.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.25, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    headlineMedium: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike headlineMedium 2021', inherit: false, color: Colors.white54, fontSize: 28.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.29, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    headlineSmall: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike headlineSmall 2021', inherit: false, color: Colors.white70, fontSize: 24.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.33, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    titleLarge:GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike titleLarge 2021', inherit: false, color: Colors.white70, fontSize: 22.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.27, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    titleMedium: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike titleMedium 2021', inherit: false, color: Colors.white70, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.15, height: 1.50, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    titleSmall: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike titleSmall 2021', inherit: false, color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1, height: 1.43, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    bodyLarge: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike bodyLarge 2021', inherit: false, color: Colors.white70, fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.5, height: 1.50, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    bodyMedium: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike bodyMedium 2021', inherit: false, color: Colors.white70, fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0.25, height: 1.43, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    bodySmall: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike bodySmall 2021', inherit: false, color: Colors.white54, fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.4, height: 1.33, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    labelLarge: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike labelLarge 2021', inherit: false, color: Colors.white70, fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1, height: 1.43, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    labelMedium: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike labelMedium 2021', inherit: false, color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.33, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),
    labelSmall: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike labelSmall 2021', inherit: false, color: Colors.white, fontSize: 11.0, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.45, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even, shadows: [Shadow(offset: Offset(1,1), blurRadius:4.0, color: Colors.white30)])),


);
