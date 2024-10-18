// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// buildScheme function returns a DynamicScheme
/// that defaults to contrast level of 0.0 from
/// the internal SchemeName constructs of the
/// [Material Color Utilities] package.
///
/// It is assume that the Platform Adaptive Color
/// Scheme Builder builds light, dark, and highContrast
/// light, and dark highContrast Color Schemes to
/// adapt to the two ways to generate Dynamic Schemes.
///
/// @author Fredrick Allan Grott
DynamicScheme buildScheme({
  required Variant variantChoice,
  required Color primaryKey,
  required bool isDark,
  double contrastLevel = 0.0,
}) {
  // ensure contrastLevel is in the right range
  assert(
    contrastLevel >= -1.0 && contrastLevel <= 1.0,
    'contrastLevel must be between [-1.0 to 1.0].',
  );

  return switch (variantChoice) {
    Variant.content => SchemeContent(
        sourceColorHct: Hct.fromInt(primaryKey.value),
        isDark: isDark,
        contrastLevel: contrastLevel,
      ),
    Variant.expressive =>
      SchemeExpressive(sourceColorHct: Hct.fromInt(primaryKey.value), isDark: isDark, contrastLevel: contrastLevel),
    Variant.fidelity =>
      SchemeFidelity(sourceColorHct: Hct.fromInt(primaryKey.value), isDark: isDark, contrastLevel: contrastLevel),
    Variant.fruitSalad =>
      SchemeFruitSalad(sourceColorHct: Hct.fromInt(primaryKey.value), isDark: isDark, contrastLevel: contrastLevel),
    Variant.monochrome =>
      SchemeMonochrome(sourceColorHct: Hct.fromInt(primaryKey.value), isDark: isDark, contrastLevel: contrastLevel),
    Variant.neutral =>
      SchemeNeutral(sourceColorHct: Hct.fromInt(primaryKey.value), isDark: isDark, contrastLevel: contrastLevel),
    Variant.rainbow =>
      SchemeRainbow(sourceColorHct: Hct.fromInt(primaryKey.value), isDark: isDark, contrastLevel: contrastLevel),
    Variant.tonalSpot =>
      SchemeTonalSpot(sourceColorHct: Hct.fromInt(primaryKey.value), isDark: isDark, contrastLevel: contrastLevel),
    Variant.vibrant =>
      SchemeVibrant(sourceColorHct: Hct.fromInt(primaryKey.value), isDark: isDark, contrastLevel: contrastLevel),
  };
}
