// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Mike Rydstrom's Flex Color Scheme
// under BSD 3-clauselicnese Copyright 2023

import 'package:flutter/material.dart';
import 'package:fss_variants_contrast/src/themes/color_extensions.dart';
import 'package:fss_variants_contrast/src/themes/theme_constants.dart';


/// Enum used to described which color from the active theme's 30
/// [ColorScheme] colors, should be used for by color properties available in
/// component sub-themes.
///
/// Used when opting in on component themes. The opinionated component themes
/// typically have one or more properties called `nnnSchemeColor`. Where
/// `nnn` describes the color feature that can be set to a none default
/// [ColorScheme] based color.
/// If not set, the property is null and the default [ColorScheme] based
/// color behavior of the opinionated component theme will be used. This may
/// differ from the corresponding Widget's SDK default un-themed color behavior,
/// but is often the same if defined at all.
///
/// The enum selection `primaryVariant` and `secondaryVariant` colors have been
/// deprecated in v4.2.0 as they were deprecated in Flutter SDK stable 2.10.0.
enum SchemeColor {
  /// The active theme's color scheme primary color will be used.
  primary,

  /// The active theme's color scheme  onPrimary color will be used.
  onPrimary,

  /// The active theme's color scheme primaryContainer color will be used.
  primaryContainer,

  /// The active theme's color scheme onPrimaryContainer color will be used.
  onPrimaryContainer,

  /// The active theme's color scheme primaryFixed color will be used.
  primaryFixed,

  /// The active theme's color scheme primaryFixedDim color will be used.
  primaryFixedDim,

  /// The active theme's color scheme onPrimaryFixed color will be used.
  onPrimaryFixed,

  /// The active theme's color scheme onPrimaryFixedVariant color will be used.
  onPrimaryFixedVariant,

  /// The active theme's color scheme secondary color will be used.
  secondary,

  /// The active theme's color scheme onSecondary color will be used.
  onSecondary,

  /// The active theme's color scheme secondaryContainer color will be used.
  secondaryContainer,

  /// The active theme's color scheme onSecondaryContainer color will be used.
  onSecondaryContainer,

  /// The active theme's color scheme secondaryFixed color will be used.
  secondaryFixed,

  /// The active theme's color scheme secondaryFixedDim color will be used.
  secondaryFixedDim,

  /// The active theme's color scheme onSecondaryFixed color will be used.
  onSecondaryFixed,

  /// The active theme's color scheme onSecondaryFixedVariant color will be used.
  onSecondaryFixedVariant,

  /// The active theme's color scheme tertiary color will be used.
  tertiary,

  /// The active theme's color scheme onTertiary color will be used.
  onTertiary,

  /// The active theme's color scheme tertiaryContainer color will be used.
  tertiaryContainer,

  /// The active theme's color scheme onTertiaryContainer color will be used.
  onTertiaryContainer,

  /// The active theme's color scheme tertiaryFixed color will be used.
  tertiaryFixed,

  /// The active theme's color scheme tertiaryFixedDim color will be used.
  tertiaryFixedDim,

  /// The active theme's color scheme onTertiaryFixed color will be used.
  onTertiaryFixed,

  /// The active theme's color scheme onTertiaryFixedVariant color will be used.
  onTertiaryFixedVariant,

  /// The active theme's color scheme error color will be used.
  error,

  /// The active theme's color scheme onError color will be used.
  onError,

  /// The active theme's color scheme errorContainer color will be used.
  errorContainer,

  /// The active theme's color scheme onErrorContainer color will be used.
  onErrorContainer,

  /// The active theme's color scheme surface color will be used.
  surface,

  /// The active theme's color scheme  onSurface color will be used.
  onSurface,

  onSurfaceVariant,

  /// The active theme's color scheme surfaceDim color will be used.
  surfaceDim,

  /// The active theme's color scheme surfaceBright color will be used.
  surfaceBright,

  /// The active theme's color scheme surfaceContainerLowest color will be used.
  surfaceContainerLowest,

  /// The active theme's color scheme surfaceContainerLow color will be used.
  surfaceContainerLow,

  /// The active theme's color scheme surfaceContainer color will be used.
  surfaceContainer,

  /// The active theme's color scheme surfaceContainerHigh color will be used.
  surfaceContainerHigh,

  /// The active theme's color scheme surfaceContainerHighest color will be used.
  surfaceContainerHighest,

  /// The active theme's color scheme outline color will be used.
  outline,

  /// The active theme's color scheme outlineVariant color will be used.
  outlineVariant,

  /// The active theme's color scheme shadow color will be used.
  shadow,

  /// The active theme's color scheme scrim color will be used.
  scrim,

  /// The active theme's color scheme inverseSurface color will be used.
  inverseSurface,

  /// The active theme's color scheme onInverseSurface color will be used.
  onInverseSurface,

  /// The active theme's color scheme inversePrimary color will be used.
  inversePrimary,

  /// The active theme's color scheme surfaceTint color will be used.
  surfaceTint,
}

/// Returns the [Color] from passed in [ColorScheme] in [colorScheme]
/// corresponding to the [SchemeColor] enum selection in [value].
///
/// This function is used to select a none default color available in the
/// theme's [ColorScheme] in opinionated sub-themes, used for example by:
///
/// - [TextField] in [FlexSubThemes.inputDecorationTheme]
/// - [TabBar] indicator color
/// - [BottomNavigationBar] in [FlexSubThemes.bottomNavigationBar]
/// - [NavigationBar] in [FlexSubThemes.navigationBarTheme]
/// - [ChipThemeData] from [FlexSubThemes.chipTheme].
/// - [FloatingActionButton] from [FlexSubThemes.floatingActionButtonTheme]
///
/// More adjustable color properties may be added in later versions.
Color schemeColor(SchemeColor value, ColorScheme colorScheme) {
  switch (value) {
    case SchemeColor.primary:
      return colorScheme.primary;
    case SchemeColor.onPrimary:
      return colorScheme.onPrimary;
    case SchemeColor.primaryContainer:
      return colorScheme.primaryContainer;
    case SchemeColor.onPrimaryContainer:
      return colorScheme.onPrimaryContainer;
    case SchemeColor.primaryFixed:
      return colorScheme.primaryFixed;
    case SchemeColor.primaryFixedDim:
      return colorScheme.primaryFixedDim;
    case SchemeColor.onPrimaryFixed:
      return colorScheme.onPrimaryFixed;
    case SchemeColor.onPrimaryFixedVariant:
      return colorScheme.onPrimaryFixedVariant;
    case SchemeColor.secondary:
      return colorScheme.secondary;
    case SchemeColor.onSecondary:
      return colorScheme.onSecondary;
    case SchemeColor.secondaryContainer:
      return colorScheme.secondaryContainer;
    case SchemeColor.onSecondaryContainer:
      return colorScheme.onSecondaryContainer;
    case SchemeColor.secondaryFixed:
      return colorScheme.secondaryFixed;
    case SchemeColor.secondaryFixedDim:
      return colorScheme.secondaryFixedDim;
    case SchemeColor.onSecondaryFixed:
      return colorScheme.onSecondaryFixed;
    case SchemeColor.onSecondaryFixedVariant:
      return colorScheme.onSecondaryFixedVariant;
    case SchemeColor.tertiary:
      return colorScheme.tertiary;
    case SchemeColor.onTertiary:
      return colorScheme.onTertiary;
    case SchemeColor.tertiaryContainer:
      return colorScheme.tertiaryContainer;
    case SchemeColor.onTertiaryContainer:
      return colorScheme.onTertiaryContainer;
    case SchemeColor.tertiaryFixed:
      return colorScheme.tertiaryFixed;
    case SchemeColor.tertiaryFixedDim:
      return colorScheme.tertiaryFixedDim;
    case SchemeColor.onTertiaryFixed:
      return colorScheme.onTertiaryFixed;
    case SchemeColor.onTertiaryFixedVariant:
      return colorScheme.onTertiaryFixedVariant;
    case SchemeColor.error:
      return colorScheme.error;
    case SchemeColor.onError:
      return colorScheme.onError;
    case SchemeColor.errorContainer:
      return colorScheme.errorContainer;
    case SchemeColor.onErrorContainer:
      return colorScheme.onErrorContainer;
    case SchemeColor.surface:
      return colorScheme.surface;
    case SchemeColor.onSurface:
      return colorScheme.onSurface;
    case SchemeColor.onSurfaceVariant:
      return colorScheme.onSurfaceVariant;
    case SchemeColor.surfaceDim:
      return colorScheme.surfaceDim;
    case SchemeColor.surfaceBright:
      return colorScheme.surfaceBright;
    case SchemeColor.surfaceContainerLowest:
      return colorScheme.surfaceContainerLowest;
    case SchemeColor.surfaceContainerLow:
      return colorScheme.surfaceContainerLow;
    case SchemeColor.surfaceContainer:
      return colorScheme.surfaceContainer;
    case SchemeColor.surfaceContainerHigh:
      return colorScheme.surfaceContainerHigh;
    case SchemeColor.surfaceContainerHighest:
      return colorScheme.surfaceContainerHighest;
    case SchemeColor.outline:
      return colorScheme.outline;
    case SchemeColor.outlineVariant:
      return colorScheme.outlineVariant;
    case SchemeColor.shadow:
      return colorScheme.shadow;
    case SchemeColor.scrim:
      return colorScheme.scrim;
    case SchemeColor.inverseSurface:
      return colorScheme.inverseSurface;
    case SchemeColor.onInverseSurface:
      return colorScheme.onInverseSurface;
    case SchemeColor.inversePrimary:
      return colorScheme.inversePrimary;
    case SchemeColor.surfaceTint:
      return colorScheme.surfaceTint;
  }
}

/// Returns the correct [SchemeColor] to be used as contrasting on
/// [SchemeColor] pair for [SchemeColor] passed in via [value].
SchemeColor onSchemeColor(SchemeColor value) {
  switch (value) {
    case SchemeColor.primary:
    case SchemeColor.surfaceTint:
      return SchemeColor.onPrimary;
    case SchemeColor.onPrimary:
      return SchemeColor.primary;
    case SchemeColor.primaryContainer:
      return SchemeColor.onPrimaryContainer;
    case SchemeColor.onPrimaryContainer:
      return SchemeColor.primaryContainer;
    case SchemeColor.primaryFixed:
      return SchemeColor.onPrimaryFixed;
    case SchemeColor.onPrimaryFixed:
      return SchemeColor.primaryFixed;
    case SchemeColor.primaryFixedDim:
      return SchemeColor.onPrimaryFixedVariant;
    case SchemeColor.onPrimaryFixedVariant:
      return SchemeColor.primaryFixedDim;
    case SchemeColor.secondary:
      return SchemeColor.onSecondary;
    case SchemeColor.onSecondary:
      return SchemeColor.secondary;
    case SchemeColor.secondaryContainer:
      return SchemeColor.onSecondaryContainer;
    case SchemeColor.onSecondaryContainer:
      return SchemeColor.secondaryContainer;
    case SchemeColor.secondaryFixed:
      return SchemeColor.onSecondaryFixed;
    case SchemeColor.onSecondaryFixed:
      return SchemeColor.secondaryFixed;
    case SchemeColor.secondaryFixedDim:
      return SchemeColor.onSecondaryFixedVariant;
    case SchemeColor.onSecondaryFixedVariant:
      return SchemeColor.secondaryFixedDim;
    case SchemeColor.tertiary:
      return SchemeColor.onTertiary;
    case SchemeColor.onTertiary:
      return SchemeColor.tertiary;
    case SchemeColor.tertiaryContainer:
      return SchemeColor.onTertiaryContainer;
    case SchemeColor.onTertiaryContainer:
      return SchemeColor.tertiaryContainer;
    case SchemeColor.tertiaryFixed:
      return SchemeColor.onTertiaryFixed;
    case SchemeColor.onTertiaryFixed:
      return SchemeColor.tertiaryFixed;
    case SchemeColor.tertiaryFixedDim:
      return SchemeColor.onTertiaryFixedVariant;
    case SchemeColor.onTertiaryFixedVariant:
      return SchemeColor.tertiaryFixedDim;
    case SchemeColor.error:
      return SchemeColor.onError;
    case SchemeColor.onError:
      return SchemeColor.error;
    case SchemeColor.errorContainer:
      return SchemeColor.onErrorContainer;
    case SchemeColor.onErrorContainer:
      return SchemeColor.errorContainer;
    case SchemeColor.surface:
    case SchemeColor.surfaceDim:
    case SchemeColor.surfaceBright:
    case SchemeColor.surfaceContainerLowest:
    case SchemeColor.surfaceContainerLow:
    case SchemeColor.surfaceContainer:
    case SchemeColor.surfaceContainerHigh:
    case SchemeColor.surfaceContainerHighest:
      return SchemeColor.onSurface;
    case SchemeColor.onSurface:
      return SchemeColor.surface;
    case SchemeColor.onSurfaceVariant:
      return SchemeColor.surfaceContainerHighest;
    case SchemeColor.outline:
    // changed from background as best guess
      return SchemeColor.onSurface;
    case SchemeColor.outlineVariant:
      // changed from onNackground as best guess
      return SchemeColor.surface;
    case SchemeColor.shadow:
      return SchemeColor.outline;
    case SchemeColor.scrim:
      return SchemeColor.outline;
    case SchemeColor.inverseSurface:
      return SchemeColor.onInverseSurface;
    case SchemeColor.onInverseSurface:
      return SchemeColor.inverseSurface;
    case SchemeColor.inversePrimary:
      return SchemeColor.onSurface;
    
  }
}


/// Returns the [Color] from passed in [ColorScheme] in [colorScheme]
  /// that is the "on" color pair corresponding to the [SchemeColor] enum
  /// value passed in via [value].
  ///
  /// This function is used to get the color value for the color pair to the
  /// passed in scheme enum value, thus giving the correct Colorscheme based
  /// contrast color for the provided [SchemeColor]. For example passing in
  /// [SchemeColor.primary] enum value, will return the [ColorScheme.onPrimary].
  /// Wise versa, passing in [SchemeColor.onPrimary] will return the color
  /// [ColorScheme.primary].
  Color schemeColorPair(SchemeColor value, ColorScheme colorScheme) =>
      schemeColor(onSchemeColor(value), colorScheme);



// Returns the FCS opinionated tinted hover color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  Color tintedHovered(Color overlay, Color tint, [double factor = 1]) {
    // Starting kAlphaHover 0x14=20=8%, same as M3 opacity on hover.
    final int usedAlpha = (kAlphaHovered * factor).round().clamp(0x00, 0xFF);
    // Tint color alpha blend into overlay kTintHover  0x99=153= 60%
    return overlay.blendAlpha(tint, kTintHover).withAlpha(usedAlpha);
  }

  /// Returns the FCS opinionated tinted highlight color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  Color tintedHighlight(Color overlay, Color tint, [double factor = 1]) {
    // Starting kAlphaHighlight 0x14 = 20 = 8%, same as M3 opacity on hover.
    final int usedAlpha = (kAlphaHighlight * factor).round().clamp(0x00, 0xFF);
    // Tint color alpha blend into overlay kTintHighlight 0xA5 = 165 = 65%
    return overlay.blendAlpha(tint, kTintHighlight).withAlpha(usedAlpha);
  }

  /// Returns the FCS opinionated tinted splash color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  Color tintedSplash(Color overlay, Color tint, [double factor = 1]) {
    // Starting kAlphaSplash 0x1F = 31 = 12.16%, same as M3 opacity on pressed.
    final int usedAlpha = (kAlphaSplash * factor).round().clamp(0x00, 0xFF);
    // Tint color alpha blend into overlay kTintSplash 0xA5 = 165 = 65%
    return overlay.blendAlpha(tint, kTintSplash).withAlpha(usedAlpha);
  }

  /// Returns the FCS opinionated tinted splash color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  Color tintedPressed(Color overlay, Color tint, [double factor = 1]) {
    // Starting kAlphaPressed 0x1F = 31 = 12.16%, same as M3 opacity on pressed.
    final int usedAlpha = (kAlphaPressed * factor).round().clamp(0x00, 0xFF);
    // Tint color alpha blend into overlay kTintPressed 0xA5 = 165 = 65%
    return overlay.blendAlpha(tint, kTintPressed).withAlpha(usedAlpha);
  }

  /// Returns the FCS opinionated tinted focus color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  Color tintedFocused(Color overlay, Color tint, [double factor = 1]) {
    // Starting kAlphaFocus 0x1F = 31 = 12.16%, same as M3 opacity on focus.
    final int usedAlpha = (kAlphaFocused * factor).round().clamp(0x00, 0xFF);
    // Tint color alpha blend into overlay kTintFocus 0xB2 = 178 = 70%.
    return overlay.blendAlpha(tint, kTintFocus).withAlpha(usedAlpha);
  }

  /// Returns the FCS opinionated tinted disabled color on an overlay color.
  ///
  /// Typically the primary color is the color used as tint base.
  /// The tint effect is different for light and dark mode.
  Color tintedDisable(Color overlay, Color tint) =>
      // Tint color alpha blend into overlay #66=40%
      // Opacity of result #61=38%, same as M3 opacity on disable.
      overlay.blendAlpha(tint, kTintDisabled).withAlpha(kAlphaDisabled);


 /// A factor used by tinted interactions to increase the alpha based
  /// opacity Material 3 baseline based opacity values for hover, focus and
  /// splash under certain conditions.
  ///
  /// Used by component themes. The factor is different depending on
  /// if the color is light or dark. This factor increases the opacity of
  /// the overlay color compared to the opacity used by M3 default. It works
  /// well because the overlay color is also alpha blend colored. This extra
  /// factor is used for interaction effects on colored widgets, when
  /// using interactions on surface colors a lower factor is used.
  double tintAlphaFactor(Color color, Brightness mode,
      [bool surfaceMode = false,]) {
    if (mode == Brightness.light) {
      return surfaceMode
          ? ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 1.5
              : 4.0
          : ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 5.0
              : 2.0;
    } else {
      return surfaceMode
          ? ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 5.0
              : 2.0
          : ThemeData.estimateBrightnessForColor(color) == Brightness.dark
              ? 5.0
              : 4.0;
    }
  }
