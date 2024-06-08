// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// How one approaches Custom Fonts And the Text theme
/// is to assume we need the full geometry in but not
/// the color as the color for both light and dark 
/// themes for textTheme will be black and white 
/// applied via the apply TextTheme method and 
/// primary color will be applied for primaryTextTheme
/// the same way. Thus, we only need one app text theme
/// for all those use cases.
///
/// Going straight from the Typography class for an 
/// internationalized app we need TextTheme TextStyle of
///  EnglishLike specifically the abstract final class
///  _M3Typography englishLike TextTheme text styles.
///
/// @author Fredrick Allan Grott
TextTheme appTextTheme = TextTheme(
  displayLarge: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike displayLarge 2021', inherit: false, fontSize: 57.0, fontWeight: FontWeight.w400, letterSpacing: -0.25, height: 1.12, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
   displayMedium: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike displayMedium 2021', inherit: false, fontSize: 45.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.16, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    displaySmall: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike displaySmall 2021', inherit: false, fontSize: 36.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.22, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    headlineLarge: GoogleFonts.rubik(textStyle: const  TextStyle(debugLabel: 'englishLike headlineLarge 2021', inherit: false, fontSize: 32.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.25, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    headlineMedium: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike headlineMedium 2021', inherit: false, fontSize: 28.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.29, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    headlineSmall: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike headlineSmall 2021', inherit: false, fontSize: 24.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.33, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    titleLarge:GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike titleLarge 2021', inherit: false, fontSize: 22.0, fontWeight: FontWeight.w400, letterSpacing: 0.0, height: 1.27, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    titleMedium: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike titleMedium 2021', inherit: false, fontSize: 16.0, fontWeight: FontWeight.w500, letterSpacing: 0.15, height: 1.50, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    titleSmall: GoogleFonts.rubik(textStyle: const TextStyle(debugLabel: 'englishLike titleSmall 2021', inherit: false, fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1, height: 1.43, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    bodyLarge: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike bodyLarge 2021', inherit: false, fontSize: 16.0, fontWeight: FontWeight.w400, letterSpacing: 0.5, height: 1.50, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    bodyMedium: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike bodyMedium 2021', inherit: false, fontSize: 14.0, fontWeight: FontWeight.w400, letterSpacing: 0.25, height: 1.43, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    bodySmall: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike bodySmall 2021', inherit: false, fontSize: 12.0, fontWeight: FontWeight.w400, letterSpacing: 0.4, height: 1.33, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    labelLarge: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike labelLarge 2021', inherit: false, fontSize: 14.0, fontWeight: FontWeight.w500, letterSpacing: 0.1, height: 1.43, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    labelMedium: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike labelMedium 2021', inherit: false, fontSize: 12.0, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.33, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
    labelSmall: GoogleFonts.inter(textStyle: const TextStyle(debugLabel: 'englishLike labelSmall 2021', inherit: false, fontSize: 11.0, fontWeight: FontWeight.w500, letterSpacing: 0.5, height: 1.45, textBaseline: TextBaseline.alphabetic, leadingDistribution: TextLeadingDistribution.even)),
);
