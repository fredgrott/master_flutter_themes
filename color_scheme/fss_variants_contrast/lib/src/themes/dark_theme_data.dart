// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fss_variants_contrast/src/themes/actions_icon_theme.dart';
import 'package:fss_variants_contrast/src/themes/app_bar_theme.dart';
import 'package:fss_variants_contrast/src/themes/dark_color_scheme.dart';
import 'package:fss_variants_contrast/src/themes/dark_primary_text_theme.dart';
import 'package:fss_variants_contrast/src/themes/dark_text_theme.dart';
import 'package:fss_variants_contrast/src/themes/dropdown_menu_theme_data.dart';
import 'package:fss_variants_contrast/src/themes/icon_button_theme_data.dart';
import 'package:fss_variants_contrast/src/themes/icon_theme_data.dart';
import 'package:fss_variants_contrast/src/themes/input_decoration_theme.dart';
import 'package:fss_variants_contrast/src/themes/menu_theme_data.dart';
import 'package:fss_variants_contrast/src/themes/tooltip_theme_data.dart';

/// Function outputs a ThemeData with brightness set, ColorScheme set, dividerColor set,
/// and useMaterial3 flag set to true.  Typically with ThemeData functions I use both a
/// BuildContext and seed color parameters to ease use of extra boilerplate.
///
/// @author Fredrick Allan Grott
ThemeData darkThemeData({
  // context, so can grab ThemeData itself
  required BuildContext context,

  // brand color one as ColorScheme seed
  required Color brandOneSeedColor,

  // brand color two as seed color
  required Color brandTwoSeedColor,

  // brand color three as seed color
  required Color brandThreeSeedColor,
}) {
  return ThemeData(
    applyElevationOverlayColor: true,
    brightness: Brightness.dark,
    colorScheme: darkColorScheme(brandOneSeedColor, brandTwoSeedColor, brandThreeSeedColor),
    dividerColor: Theme.of(context).colorScheme.outlineVariant,
    useMaterial3: true,
    dropdownMenuTheme: dropdownMenuThemeData(
      colorScheme: Theme.of(context).colorScheme,
      inputDecorationTheme: inputDecorationTheme(colorScheme:  Theme.of(context).colorScheme),
    ),
    appBarTheme: appBarTheme(
      colorScheme: Theme.of(context).colorScheme,
      // most modern flutter apps set appbar to some transparency
     // backgroundColor: Theme.of(context).colorScheme.surface,
      // color for IconTheme and ActiionsTheme
     // foregroundColor: Theme.of(context).colorScheme.onSurface,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 3.0,
      iconTheme: iconThemeData(Theme.of(context).colorScheme.onSurface),
      actionsIconTheme: actionsIconTheme(Theme.of(context).colorScheme.onSurfaceVariant),
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      // note for transparency to full work have to set the
      // extendBodyBehindAppBar property which is not
      // in ThemeData Themes
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        systemStatusBarContrastEnforced: true,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(color: Theme.of(context).colorScheme.onSurface),
      toolbarTextStyle:
          Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSurface),
    ),
    textTheme: darkTextTheme(),
    primaryTextTheme: darkPrimaryTextTheme(Theme.of(context).colorScheme.primary),
    primaryIconTheme: iconThemeData(Theme.of(context).colorScheme.primary),
    iconButtonTheme: iconButtonThemeData(colorScheme: Theme.of(context).colorScheme),
    menuTheme: menuThemeData(colorScheme: Theme.of(context).colorScheme),
    tooltipTheme: tooltipThemeData(colorScheme: Theme.of(context).colorScheme),
  );
}
