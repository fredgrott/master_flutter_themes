// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// has to have englishLike as that has the geometry
// and that as regular text theme will merge with black
// or white color dependening on themeMode.
//
// The logic of how textTheme is merged is in the ThemeData
// source coe lines 467 to 487. With non primary text theme
// the light mode black or dark white color text theme
// will be merged with our defined one.
//
// For primary we have to include the primary color so that
// black or white is overriden.
//
// I use a Theme.of(context) hook to make it less boilerplate
// dense as we can grab the defined textStyle and input it into
// the GoogleFonts textStyle parameter to get GoogleFonts to
// deliver the right textStyle without manually defining every
// thing by hand.

import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:fss_way/themes/build_context_extensions.dart';
import 'package:google_fonts/google_fonts.dart';


TextTheme appTextTheme(BuildContext context) => TextTheme(
      displayLarge: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(fontVariations: <ui.FontVariation>[const FontVariation('wght', 400.0)]),),
      displayMedium: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      displaySmall: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      headlineLarge: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      headlineMedium: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      headlineSmall: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      titleLarge: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      titleMedium: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 500.0)]),),
      titleSmall: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 500.0)]),),
      labelLarge: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 500.0)]),),
      labelMedium: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 500.0)]),),
      labelSmall: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 500.0)]),),
      bodyLarge: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      bodyMedium: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      bodySmall: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
    );

TextTheme appPrimaryTextTheme(BuildContext context) => TextTheme(
      displayLarge: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      displayMedium: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      displaySmall: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .displaySmall
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      headlineLarge: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      headlineMedium: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 300.0)]),),
      headlineSmall: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      titleLarge: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      titleMedium: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 500.0)]),),
      titleSmall: GoogleFonts.robotoSerif(
          textStyle: Theme.of(context)
              .textTheme
              .titleSmall
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 500.0)]),),
      labelLarge: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 500.0)]),),
      labelMedium: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .labelMedium
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 500.0)]),),
      labelSmall: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 500.0)]),),
      bodyLarge: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      bodyMedium: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
      bodySmall: GoogleFonts.robotoFlex(
          textStyle: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: context.primary, fontVariations: <FontVariation>[const FontVariation('wght', 400.0)]),),
    );
