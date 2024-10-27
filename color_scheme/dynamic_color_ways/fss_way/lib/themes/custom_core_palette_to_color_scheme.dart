// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Dynamic Color under 
// Apache 2.0 License Copyright 2021


import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:fss_way/themes/build_color_scheme.dart';
import 'package:fss_way/themes/theme_tokens.dart';

/// The design effect of switching from SDK CS gen
/// to FSS CS gen  is to have all platforms have the 
/// exact same scheme variant whereas under SDK CS
/// gen the scheme variant from Android device itself
/// would be the scheme variant on Flutter App on
/// an Android device.
///
/// Actually if one wanted to use SDK CS gen
/// you would have to match the bottom half of 
/// the internal workings of the ColorScheme.fromSeeds
/// method; namely call _buildDynamicScheme to 
/// generate the scheme and then use scheme
/// to populate the color scheme with the 
/// MaterialDynamicColors.colorRole.getArgb(scheme)
/// as the Color() parameter. 
extension CustomCorePaletteToColorScheme on CorePalette {

  /// Create a [ColorScheme] from the given `palette` obtained from the Android OS.
  ColorScheme toColorScheme({
    Brightness brightness = Brightness.light,
  }) {
    final Scheme scheme;

    switch (brightness) {
      // CorePalette in Android native reflects the 
      // scheme variant chosen and the wallpaper color
      // applied. To prevent it looking funky between
      // dynamic color platforms and non dynamic color
      // platforms I use the colors of the scheme 
      // as seed keys in generating the color scheme
      case Brightness.light:
        scheme = Scheme.lightFromCorePalette(this);
        break;
      case Brightness.dark:
        scheme = Scheme.darkFromCorePalette(this);
        break;
    }
    // since FSS is used to get CS lets do that here
    // too. Also, have to do it this way as obviously
    // we do not have an ImageProvider of the Android
    // wallpaper color.
    return buildColorScheme(
      appBrightness: brightness,
      variant: ThemeTokens.appSchemeVariant,
      appPrimaryBrand: Color(scheme.primary),
      appSecondaryBrand: Color(scheme.secondary),
      appTertiaryBrand: Color(scheme.tertiary),
      appErrorBrand: Color(scheme.error),
      appNeutralBrand: Color(scheme.surface),
      appNeutralVariantBrand: Color(scheme.surfaceVariant),
      useExpressiveOnContainer: ThemeTokens.appUseExpressiveOnColors,
      appContrastLevel: ThemeTokens.appStandardContrastLevel,
    );

  }
}