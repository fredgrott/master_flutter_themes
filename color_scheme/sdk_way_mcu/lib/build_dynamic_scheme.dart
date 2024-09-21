// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';



/// Meant to be used in combination with the function to build a
/// color scheme. Temporary as at some point the Flutter SDK will 
/// change to use the DynamicScheme from the Material Color Utilities
/// package.
///
/// @author Fredrick Allan Grott
DynamicScheme buildDynamicScheme({
  required Brightness brightness,
  required DynamicSchemeVariant variant,
  required Color primarySeedColor,
  double contrastLevel = 0.0,
}) {
  assert(
    contrastLevel >= -1.0 && contrastLevel <= 1.0,
    'contrastLevel must be between [-1.0 to 1.0].',
  );
  final bool isDark = brightness == Brightness.dark;
  final Hct primarySourceColor = Hct.fromInt(primarySeedColor.value);
  

  debugPrint('primarySourceColor = $primarySourceColor');
 

  return switch (variant) {
      DynamicSchemeVariant.tonalSpot => SchemeTonalSpot(
        sourceColorHct: primarySourceColor, 
        isDark: isDark, 
        contrastLevel: contrastLevel,),
      DynamicSchemeVariant.fidelity => SchemeFidelity(
        sourceColorHct: primarySourceColor, 
        isDark: isDark, 
        contrastLevel: contrastLevel,),
      DynamicSchemeVariant.content => SchemeContent(
        sourceColorHct: primarySourceColor, 
        isDark: isDark, 
        contrastLevel: contrastLevel,),
      DynamicSchemeVariant.monochrome => SchemeMonochrome(
        sourceColorHct: primarySourceColor, 
        isDark: isDark, 
        contrastLevel: contrastLevel,),
      DynamicSchemeVariant.neutral => SchemeNeutral(
        sourceColorHct: primarySourceColor, 
        isDark: isDark, 
        contrastLevel: contrastLevel,),
      DynamicSchemeVariant.vibrant => SchemeVibrant(
        sourceColorHct: primarySourceColor, 
        isDark: isDark, 
        contrastLevel: contrastLevel,),
      DynamicSchemeVariant.expressive => SchemeExpressive(
        sourceColorHct: primarySourceColor, 
        isDark: isDark, 
        contrastLevel: contrastLevel,),
      DynamicSchemeVariant.rainbow => SchemeRainbow(
        sourceColorHct: primarySourceColor, 
        isDark: isDark, 
        contrastLevel: contrastLevel,),
      DynamicSchemeVariant.fruitSalad => SchemeFruitSalad(
        sourceColorHct: primarySourceColor, 
        isDark: isDark, 
        contrastLevel: contrastLevel,),
  };
}
