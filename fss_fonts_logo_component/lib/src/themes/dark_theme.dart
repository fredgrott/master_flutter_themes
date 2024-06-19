// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter/material.dart';
import 'package:fss_fonts_logo_component/src/themes/custom_app_bar_theme.dart';
import 'package:fss_fonts_logo_component/src/themes/primary_text_theme.dart';
import 'package:fss_fonts_logo_component/src/themes/text_theme_dark.dart';

/// The full [ThemeData] constructor is generally
/// the best one to use to theme apps. The trick is to supply
/// a color scheme that serves two purposes at once. Number one 
/// it allows certain widgets to get the color scheme from 
/// theme data. Number two, allows us to pass it to component
/// themes to set individual color properties.
///
/// Grab bag color properies not yet depreciated that I need
/// to use supplied ColorScheme to fill from issue 91772 at
///  https://github.com/flutter/flutter/issues/91772
/// are:
///     canvasColor
///     scaffoldBackgroungColor
///     cardColor
///     dividerColor
///     unselectedWidgetColor
///     secondaryHeaderColor
///     dialogBackgroundColor
///     indicatorColor
///     dialogBackgroundColor
///     hintColor
///     shadowColor
///     disabledColor
///
///     These are suppose to be no longer used in 
///     in normalized MD3 widgets so probably do not
///     have to set
///     splashColor
///     focusColor
///     hoverColor
///     highlightColor
///
///  Also, recheck CardTheme, DialogTheme, And TabBarTheme
///  as they supposedly are not fully MD3 normalized yet.
///
///  Widgets with adaptive constructors are:
///        Switch
///        Slider
///        CircularProgressIndicator
///        Checkbox
///        Radio
///  However, I do not use the adaptations slot to 
///  modify visual theme colors for other platforms such as
///  iOS and MacOS. Practical reason is that Flutter SDK
///  team does not have enough manpower to do all the widgets
///  using this strategy. Thus, long-term strategy is to 
///  use Flex Color Scheme's way of ThemeModifications 
///  per platform.
///
/// @author Fredrick Allan Grott
ThemeData darkTheme(BuildContext context, ColorScheme customColorScheme) {
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: customColorScheme,
    // fix per FSS notes as of flutter sdk 3.22
    dividerColor: customColorScheme.outlineVariant,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: textThemeDark(),
    primaryTextTheme: primaryTextTheme(customColorScheme),
    appBarTheme: customDarkAppBarTheme(context, customColorScheme),
  );
}
