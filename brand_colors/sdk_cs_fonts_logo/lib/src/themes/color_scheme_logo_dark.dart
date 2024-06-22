// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// ColorScheme is computed using brand color via SchemeContent
/// construct from the Material Color Utilities package. 
/// 
/// Both SchemeContent and SchemeFidelity from the Material Color Utilities
/// package put the source color in the primary container with it being adjusted
/// -+5 in tone light and -5 tone in dark modes. With the Tertiary Container its
/// an analogous color found by dividing color wheel into 6.
/// 
///  This is one way to calculate it. The other way to calculate it is to use the
///   ColorScheme.fromSeed function with the seedColor being the brand 
///   color and supply a DynamicSchemeVariant.content or DynamicSchemeVariant.fidelity
///   and the contrastLevel.
/// 
///   Also, note that it is my assumption that one can get higher contrast themes 
///   via supplying a higher contrast level.
/// 
/// @author Fredrick Allan Grott
ColorScheme colorSchemeLogoDark(Color seedColor) {
  final Hct logoHCT = Hct.fromInt(seedColor.value);

  final SchemeContent logoScheme = SchemeContent(sourceColorHct: logoHCT, isDark: true, contrastLevel: 0.5);

  return ColorScheme(
    brightness: Brightness.dark, 
    primary: Color(MaterialDynamicColors.primary.getArgb(logoScheme)), 
    onPrimary: Color(MaterialDynamicColors.onPrimary.getArgb(logoScheme)), 
    primaryContainer: Color(MaterialDynamicColors.primaryContainer.getArgb(logoScheme)),
    onPrimaryContainer: Color(MaterialDynamicColors.onPrimaryContainer.getArgb(logoScheme)),
    primaryFixed: Color(MaterialDynamicColors.primaryFixed.getArgb(logoScheme)),
    onPrimaryFixed: Color(MaterialDynamicColors.onPrimaryFixed.getArgb(logoScheme)),
    primaryFixedDim: Color(MaterialDynamicColors.primaryFixedDim.getArgb(logoScheme)),
    onPrimaryFixedVariant: Color(MaterialDynamicColors.onPrimaryFixedVariant.getArgb(logoScheme)),
    secondary: Color(MaterialDynamicColors.secondary.getArgb(logoScheme)), 
    onSecondary: Color(MaterialDynamicColors.onSecondary.getArgb(logoScheme)), 
    secondaryContainer: Color(MaterialDynamicColors.secondaryContainer.getArgb(logoScheme)),
    onSecondaryContainer: Color(MaterialDynamicColors.onSecondaryContainer.getArgb(logoScheme)),
    secondaryFixed: Color(MaterialDynamicColors.secondaryFixed.getArgb(logoScheme)),
    secondaryFixedDim: Color(MaterialDynamicColors.secondaryFixedDim.getArgb(logoScheme)),
    onSecondaryFixed: Color(MaterialDynamicColors.onSecondaryFixed.getArgb(logoScheme)),
    onSecondaryFixedVariant: Color(MaterialDynamicColors.onSecondaryFixedVariant.getArgb(logoScheme)),
    tertiary: Color(MaterialDynamicColors.tertiary.getArgb(logoScheme)),
    onTertiary: Color(MaterialDynamicColors.onTertiary.getArgb(logoScheme)),
    tertiaryContainer: Color(MaterialDynamicColors.tertiaryContainer.getArgb(logoScheme)),
    onTertiaryContainer: Color(MaterialDynamicColors.onTertiaryContainer.getArgb(logoScheme)),
    tertiaryFixed: Color(MaterialDynamicColors.tertiaryFixed.getArgb(logoScheme)),
    tertiaryFixedDim: Color(MaterialDynamicColors.tertiaryFixedDim.getArgb(logoScheme)),
    onTertiaryFixed: Color(MaterialDynamicColors.onTertiaryFixed.getArgb(logoScheme)),
    onTertiaryFixedVariant: Color(MaterialDynamicColors.onTertiaryFixedVariant.getArgb(logoScheme)),
    error: Color(MaterialDynamicColors.error.getArgb(logoScheme)) ,
    onError: Color(MaterialDynamicColors.onError.getArgb(logoScheme)), 
    errorContainer: Color(MaterialDynamicColors.errorContainer.getArgb(logoScheme)),       
    surface: Color(MaterialDynamicColors.surface.getArgb(logoScheme)), 
    onSurface: Color(MaterialDynamicColors.onSurface.getArgb(logoScheme)),
    surfaceDim: Color(MaterialDynamicColors.surfaceDim.getArgb(logoScheme)),
    surfaceBright: Color(MaterialDynamicColors.surfaceBright.getArgb(logoScheme)),
    surfaceContainerLowest: Color(MaterialDynamicColors.surfaceContainerLowest.getArgb(logoScheme)),
    surfaceContainerLow: Color(MaterialDynamicColors.surfaceContainerLow.getArgb(logoScheme)),
    surfaceContainer: Color(MaterialDynamicColors.surfaceContainer.getArgb(logoScheme)),
    surfaceContainerHigh: Color(MaterialDynamicColors.surfaceContainerHigh.getArgb(logoScheme)),
    surfaceContainerHighest: Color(MaterialDynamicColors.surfaceContainerHighest.getArgb(logoScheme)),
    onSurfaceVariant: Color(MaterialDynamicColors.onSurfaceVariant.getArgb(logoScheme)),
    outline: Color(MaterialDynamicColors.outline.getArgb(logoScheme)),
    outlineVariant: Color(MaterialDynamicColors.outlineVariant.getArgb(logoScheme)),
    shadow: Color(MaterialDynamicColors.shadow.getArgb(logoScheme)),
    scrim: Color(MaterialDynamicColors.scrim.getArgb(logoScheme)),
    inverseSurface: Color(MaterialDynamicColors.inverseSurface.getArgb(logoScheme)),
    onInverseSurface: Color(MaterialDynamicColors.inverseOnSurface.getArgb(logoScheme)),
    inversePrimary: Color(MaterialDynamicColors.inversePrimary.getArgb(logoScheme)),
    surfaceTint: Color(MaterialDynamicColors.surfaceTint.getArgb(logoScheme)),
    );
}
