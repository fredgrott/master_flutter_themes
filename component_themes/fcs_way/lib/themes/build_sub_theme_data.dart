
import 'package:fcs_way/themes/sub_theme_data_text_styles.dart';
import 'package:fcs_way/themes/theme_tokens.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Like the Flutter SDK, [Flex Color Scheme] sets
/// Material Design 3 defaults. Thus, we instead for 
/// customization only set things we want changed from 
/// the Material Design 3 defaults for component themes.
///
/// For example the WidgetState items and the adaptive
/// themes settings.
///
/// @author Fredrick Allan Grott
FlexSubThemesData buildSubThemeData(BuildContext context) {
  return FlexSubThemesData(
    adaptiveRemoveElevationTint: ThemeTokens.adaptiveRemoveElevationTint,
    adaptiveElevationShadowsBack: ThemeTokens.adaptiveElevationShadowsBack,
    adaptiveAppBarScrollUnderOff: ThemeTokens.adaptiveAppBarScrollUnderOff,
    adaptiveRadius: ThemeTokens.adaptiveRadius,
    adaptiveDialogRadius: ThemeTokens.adaptiveDialogRadius,
    adaptiveInputDecoratorRadius: ThemeTokens.adaptiveInputDecoratorRadius,
    adaptiveSplash: ThemeTokens.adaptiveSplash,
    switchAdaptiveCupertinoLike: ThemeTokens.switchAdaptiveCupertinoLike,
    adaptiveRemoveNavigationBarTint: ThemeTokens.adaptiveRemoveNavigationBarTint,

    splashType:   ThemeTokens.splashType,
    splashTypeAdaptive:   ThemeTokens.splashTypeAdaptive,

    textButtonTextStyle:   textButtonTextStyle(context),
    filledButtonTextStyle: filledButtonTextStyle(context),
    elevatedButtonTextStyle: elevatedButtonTextStyle(context),
    outlinedButtonTextStyle: outlinedButtonTextStyle(context),
    segmentedButtonTextStyle: segmentedButtonTextStyle(context),
    menuButtonTextStyle: menuButtonTextStyle(context),
    searchBarTextStyle: searchBarTextStyle(context),
    searchBarHintStyle: searchBarHintStyle(context),

  );
}
