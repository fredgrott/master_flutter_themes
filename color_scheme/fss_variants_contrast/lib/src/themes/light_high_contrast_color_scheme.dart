// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flex_seed_scheme/flex_seed_scheme.dart';

import 'package:flutter/material.dart';

/// Function to output a Color Scheme using Flex Seed Scheme to generate the Color Scheme rather then
/// the Flutter SDK. Note, while I am using static brand colors as seed colors we do not do brand color
/// full inclusion into HTC this way. Instead of using copyWith and the static brand color we use the
///  Material Color Utilities package's Blend class the harmonized method to cause a shift towards
///  the brand color hue. The dynamic color package has not changed their example yet, so
/// you will have to wait for my example.
///
/// The function takes three static brand colors as parameters and uses them as input key colors.
/// The contrast used is medium which is the standard default for the MD3 specification for dark and
///  light themes whereas high contrast themes use the 1.0 contrast levels.
///
///  The difference between Flutter SDK Color Scheme generation and Flex Seed Scheme is that the
///  Flutter SDK uses up to 3 seed colors while Flex Seed Scheme uses 5 in the form of:
///       primaryKey
///       secondaryKey
///       tertiarykey
///       errorKey
///       neutralkey
///
///  @author Fredrick Allan Grott
ColorScheme lightHighContrastColorScheme(Color brandOneSeedColor, Color brandTwoSeedColor, Color brandThreeSeedColor) {
  return SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    primaryKey: brandOneSeedColor,
    secondaryKey: brandTwoSeedColor,
    tertiaryKey: brandThreeSeedColor,

    variant: FlexSchemeVariant.expressive,

    // -1.0 is lowest contrast, 0 is normal, 0.5 is medium contrast,
    // and 1.0 is high contrast
    contrastLevel: 1.0,
  );
}
