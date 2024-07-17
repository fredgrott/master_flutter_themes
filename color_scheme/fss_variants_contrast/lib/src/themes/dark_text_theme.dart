// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//TODO: Variable Fonts in text themes still not sorted out yet in SDK, change when SDK has fix.

/// When we use custom fonts instead of setting the
/// ThemeData typography parameter we are setting TextTheme'
/// and PrimaryTextTheme that have both color and geometry
/// of fonts applied.
///
/// Since Typography class not being used, this is a combination of
/// BlackMoutainView and _M3Typorgraph englishlike with Google Fonts
/// custom fonts replacing system device fonts.
///
/// We cannot use GoogleFonts.fontnameTextTheme() constructors
/// due to this issue 401:
///  https://github.com/material-foundation/flutter-packages/issues/401
///  the work around is to individually call TextStyle and provide the proper
///   color.
///
/// With text themes I keep the MD3 baseline and apply customizations
/// at the app screen level when required.
///
/// @author Fredrick Allan Grott
TextTheme darkTextTheme() => TextTheme(
      displayLarge: GoogleFonts.rubik(
        textStyle: const TextStyle(
          debugLabel: 'englishLike displayLarge 2021',
          color: Colors.white70,
          inherit: false,
          fontSize: 57.0,
          fontWeight: FontWeight.w400,
          letterSpacing: -0.25,
          height: 1.12,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      displayMedium: GoogleFonts.rubik(
        textStyle: const TextStyle(
          debugLabel: 'englishLike displayMedium 2021',
          color: Colors.white70,
          inherit: false,
          fontSize: 45.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.16,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      displaySmall: GoogleFonts.rubik(
        textStyle: const TextStyle(
          debugLabel: 'englishLike displaySmall 2021',
          color: Colors.white70,
          inherit: false,
          fontSize: 36.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.22,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      headlineLarge: GoogleFonts.rubik(
        textStyle: const TextStyle(
          debugLabel: 'englishLike headlineLarge 2021',
          color: Colors.white70,
          inherit: false,
          fontSize: 32.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.25,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      headlineMedium: GoogleFonts.rubik(
        textStyle: const TextStyle(
          debugLabel: 'englishLike headlineMedium 2021',
          color: Colors.white70,
          inherit: false,
          fontSize: 28.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.29,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      headlineSmall: GoogleFonts.rubik(
        textStyle: const TextStyle(
          debugLabel: 'englishLike headlineSmall 2021',
          color: Colors.white,
          inherit: false,
          fontSize: 24.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.33,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      titleLarge: GoogleFonts.rubik(
        textStyle: const TextStyle(
          debugLabel: 'englishLike titleLarge 2021',
          color: Colors.white,
          inherit: false,
          fontSize: 22.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.0,
          height: 1.27,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      titleMedium: GoogleFonts.rubik(
        textStyle: const TextStyle(
          debugLabel: 'englishLike titleMedium 2021',
          color: Colors.white,
          inherit: false,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          height: 1.50,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      titleSmall: GoogleFonts.rubik(
        textStyle: const TextStyle(
          debugLabel: 'englishLike titleSmall 2021',
          color: Colors.white,
          inherit: false,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      labelLarge: GoogleFonts.inter(
        textStyle: const TextStyle(
          debugLabel: 'englishLike labelLarge 2021',
          color: Colors.white,
          inherit: false,
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.43,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      labelMedium: GoogleFonts.inter(
        textStyle: const TextStyle(
          debugLabel: 'englishLike labelMedium 2021',
          color: Colors.white,
          inherit: false,
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.33,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      labelSmall: GoogleFonts.inter(
        textStyle: const TextStyle(
          debugLabel: 'englishLike labelSmall 2021',
          color: Colors.white,
          inherit: false,
          fontSize: 11.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          height: 1.45,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      bodyLarge: GoogleFonts.inter(
        textStyle: const TextStyle(
          debugLabel: 'englishLike bodyLarge 2021',
          color: Colors.white,
          inherit: false,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          height: 1.50,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      bodyMedium: GoogleFonts.inter(
        textStyle: const TextStyle(
          debugLabel: 'englishLike bodyMedium 2021',
          color: Colors.white,
          inherit: false,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          height: 1.43,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
      bodySmall: GoogleFonts.inter(
        textStyle: const TextStyle(
          debugLabel: 'englishLike bodySmall 2021',
          color: Colors.white70,
          inherit: false,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          height: 1.33,
          textBaseline: TextBaseline.alphabetic,
          leadingDistribution: TextLeadingDistribution.even,
          decoration: TextDecoration.none,
        ),
      ),
    );
