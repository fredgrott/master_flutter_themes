// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:fcs_services/globals/app_globals.dart';
import 'package:fcs_services/themes/app_icon_themes.dart';
import 'package:fcs_services/themes/app_text_themes.dart';
import 'package:fcs_services/themes/build_context_extensions.dart';
import 'package:fcs_services/themes/build_sub_theme_data.dart';
import 'package:fcs_services/themes/theme_tokens.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Builds light ThemeData using FlexColorScheme's
/// FlexColorScheme.light constructor.
///
/// Of particular note:
///   -color overrides not used
///   -implemented so as to be re-used
///    in widgets wrapper for both Widget testing
///    and goldens testing
///   -adaptive themes implemented
///   -theme extensions included
///
/// Design Systems wise everything in [Flex Color Scheme]
/// defaults to Material Design 3 defaults. Thus, we only
/// customize what we need to customize.
///
/// Note, I do not use Cupertino Theme as the way
/// I handle Apple devices is to set Material
/// Design Themes but then Apple device defaults
/// via Adaptive Themes. Adaptive Themes are
/// specified via SubThemesData.
///
///
/// @author Fredrick Allan Grott
ThemeData buildLightFlexColorScheme(BuildContext context, ColorScheme colorScheme, TargetPlatform platform) {
  final myThemeData = FlexColorScheme.light(
    colorScheme: colorScheme,
    appBarOpacity: 0.95,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    lightIsWhite: ThemeTokens.lightIsWhite,
    subThemesData: buildSubThemeData(context),
    useMaterial3ErrorColors: ThemeTokens.useMaterial3ErrorColors,
    variant: ThemeTokens.appSchemeVariant,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    textTheme: appTextTheme(context),
    primaryTextTheme: appPrimaryTextTheme(context),
    platform: platform,
  ).toTheme;

  myThemeData.copyWith(iconTheme: appIconThemeData(context));
  myThemeData.copyWith(primaryIconTheme: appPrimaryIconThemeData(context));

  // this is how to do more adaptive themes beyond
  // what Flex Color Scheme and the SDK have
  myThemeData.copyWith(
      appBarTheme:
          myThemeData.appBarTheme.copyWith(surfaceTintColor: isAppleWeb() ? context.outline : context.primary),);

  return myThemeData;
}

/// Builds Dark ThemeData using FlexColorScheme's
/// FlexColorScheme.dark constructor.
///
/// Of particular note:
///   -color overrides not used
///   -implemented so as to be re-used
///    in widgets wrapper for both Widget testing
///    and goldens testing
///   -adaptive themes implemented
///   -theme extensions included
/// @author Fredrick Allan Grott
ThemeData buildDarkFlexColorScheme(BuildContext context, ColorScheme colorScheme, TargetPlatform platform) {
  final myThemeData = FlexColorScheme.dark(
    colorScheme: colorScheme,
    appBarOpacity: 0.95,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    darkIsTrueBlack: ThemeTokens.darkIsTrueBlack,
    subThemesData: buildSubThemeData(context),
    variant: ThemeTokens.appSchemeVariant,
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    textTheme: appTextTheme(context),
    primaryTextTheme: appPrimaryTextTheme(context),
    platform: platform,
  ).toTheme;

  myThemeData.copyWith(
    iconTheme: appIconThemeData(context),
    primaryIconTheme: appPrimaryIconThemeData(context),
  );

  // this is how to do more adaptive themes beyond
  // what Flex Color Scheme and the SDK have
  myThemeData.copyWith(
      appBarTheme:
          myThemeData.appBarTheme.copyWith(surfaceTintColor: isAppleWeb() ? context.outline : context.primary),);

  return myThemeData;
}
