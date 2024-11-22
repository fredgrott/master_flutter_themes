// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:flutter/material.dart';

/// Design System wise we need to specify our many
/// customizations here as we want our custom code
/// extending the design system to stay the same
/// per app.
///
/// Typical tokens are brand colors, boolean to use
/// adaptive theme or not, border radius, etc. And,
/// its a sealed class to prevent modification.
///
/// @author Fredrick Allan Grott
sealed class ThemeTokens {
  // brand key colors for the fallback color schemes
  // i.e. non dynamic color platforms such as
  // IOS, Web, etc.
  // Keep in mind with using FSS to gen CS we have
  // these seedKeys:
  //    primary
  //    secondary
  //    tertiary
  //    error
  //    neutral
  //    neutralvariant
  static const Color appBrandKeyColorOne = Color(0xff02539a);
  static const Color appBrandKeyColorTwo = Color(0xff3abeef);
  static const Color appBrandKeyColorThree = Color(0xff45d1fd);
  static const Color appPrimaryKey = appBrandKeyColorOne;
  static const Color appSecondaryKey = appBrandKeyColorTwo;
  static const Color appTertiaryKey = appBrandKeyColorThree;
  static const Color appErrorKey = appBrandKeyColorOne;
  static const Color appNeutralKey = appBrandKeyColorTwo;
  static const Color appNeutralVariantKey = appBrandKeyColorThree;

  static const Color mockDynamicColor = Color(0xff804d8f);

  // brand color blend back into hct-colorscheme
  // settings, used in app wrapper
  // The color roles to blend brand colors back
  // into are:
  //   PrimaryFixed
  //   PrimaryFixedDim
  //   onPrimaryFixed
  //   onPrimaryFixedVariant
  //   SecondaryFixed
  //   SecondaryFixedDim
  //   onSecondaryFixed
  //   onSecondaryFixedVariant
  //   tertiaryFixed
  //   tertiaryFixedDim
  //   onTertiaryFixed
  //   onTertiaryFixedVariant
  //   error
  //   onError
  //   errorContainer
  //   onErrorContainer
  static const appPrimaryFixedBlend = appBrandKeyColorOne;
  static const appPrimaryFixedDimBlend = appBrandKeyColorOne;
  static const appOnPrimaryFixedBlend = appBrandKeyColorOne;
  static const appOnPrimaryFixedVariantBlend = appBrandKeyColorOne;
  static const appSecondaryFixedBlend = appBrandKeyColorTwo;
  static const appSecondaryFixedDimBlend = appBrandKeyColorTwo;
  static const appOnSecondaryFixedBlend = appBrandKeyColorTwo;
  static const appOnSecondaryFixedVariantBlend = appBrandKeyColorTwo;
  static const appTertiaryFixedBlend = appBrandKeyColorThree;
  static const appTertiaryFixedDimBlend = appBrandKeyColorThree;
  static const appOnTertiaryFixedBlend = appBrandKeyColorThree;
  static const appOnTertiaryFixedVariantBlend = appBrandKeyColorThree;
  static const appErrorBlend = appBrandKeyColorOne;
  static const appOnErrorBlend = appBrandKeyColorOne;
  static const appErrorContainerBlend = appBrandKeyColorOne;
  static const appOnErrorContainerBlend = appBrandKeyColorOne;

  static const FlexSchemeVariant appSchemeVariant = FlexSchemeVariant.tonalSpot;

  static const bool appUseExpressiveOnColors = true;

  static const double appStandardContrastLevel = 0.25;
  static const double appHighContrastLevel = 1.0;

  static const ThemeMode appThemeMode = ThemeMode.dark;

  // Flex Theme Data
  static const bool lightIsWhite = true;
  static const bool useMaterial3ErrorColors = true;
  static const bool darkIsTrueBlack = true;

  // flex sub themes data
  static const FlexAdaptive adaptiveRemoveElevationTint = FlexAdaptive.appleWeb();
  static const FlexAdaptive adaptiveElevationShadowsBack = FlexAdaptive.appleWeb();
  static const FlexAdaptive adaptiveAppBarScrollUnderOff = FlexAdaptive.off();
  static const FlexAdaptive adaptiveRadius = FlexAdaptive.appleWeb();
  static const double defaultRadiusAdaptive = 10;
  static const FlexAdaptive adaptiveDialogRadius = FlexAdaptive.appleWeb();
  static const double dialogRadiusAdaptive = 13;
  static const FlexAdaptive adaptiveInputDecoratorRadius = FlexAdaptive.appleWeb();
  static const double inputDecoratorRadiusAdaptive = 6;
  static const FlexAdaptive adaptiveSplash = FlexAdaptive.appleWeb();
  static const FlexAdaptive switchAdaptiveCupertinoLike = FlexAdaptive.appleWeb();
  static const FlexAdaptive adaptiveRemoveNavigationBarTint = FlexAdaptive.appleWeb();

  static const FlexSplashType splashType = FlexSplashType.inkRipple;
  static const FlexSplashType splashTypeAdaptive = FlexSplashType.instantSplash;
}
