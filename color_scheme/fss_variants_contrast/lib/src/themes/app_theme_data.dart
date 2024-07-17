// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// appThemeData function returns an opinionated list of 
/// [ThemeData] and its parameters to help address the 
/// pratical fact that with Google developing 3 front-ends 
/// that the Material Design spec as implemented in the 
/// Flutter SDK is in fact never finished or in polished form.
/// 
/// My Engineering strategy starts at the bottom with widgets
/// in that with the Theme widget wrapping it I can provide
/// extra styling not present in a component theme.
/// 
/// The second step is that each component theme is implemented 
/// as a function with bare mininum of ColorScheme being a required 
/// parameter and other color parameters are typed as SchemeColor
/// so that each implemented component theme function defaults
/// to Material Design 3 spec standards but at the same time when 
/// parameters are provided then overrides the  defaults so that 
/// design visions can be executed upon.
/// 
/// The third step is I make [ThemeData] as a function with some 
/// required parameters to make implementing dynamic color 
/// easier.
/// 
/// This set up with ThemeData having no work around logic makes 
///  it Design System reference friendly in that implemented 
///  component themes are set up that way.
/// 
/// @author Fredrick Allan Grott
ThemeData appThemeData({
  // brightness must be required
  // in color scheme too
  required ColorScheme colorScheme,
  required Brightness brightness,
  required TextTheme textTheme,
  required TextTheme primaryTextTheme,
  required IconThemeData iconTheme,
  required IconThemeData primaryIconTheme,
  Iterable<Adaptation<Object>>? adaptations,

  // still needed until full surfaceColor roles make to all 
  // widgets and component themes
  bool? applyElevationOverlayColor,
  NoDefaultCupertinoThemeData? cupertinoOverrideTheme,
  Iterable<ThemeExtension<dynamic>>? extensions,
  InputDecorationTheme? inputDecorationTheme,
  MaterialTapTargetSize? materialTapTargetSize,
  PageTransitionsTheme? pageTransitionsTheme,
  TargetPlatform? platform,
  ScrollbarThemeData? scrollbarTheme,
  InteractiveInkFeatureFactory? splashFactory,

  // auto set to true
 // bool? useMaterial3,

// auto set to  be adaptive to platform on
// VisualDensity? visualDensity,

  ActionIconThemeData? actionIconTheme,
  AppBarTheme? appBarTheme,
  BadgeThemeData? badgeTheme,
  MaterialBannerThemeData? bannerTheme,
  BottomNavigationBarThemeData? bottomNavigationBarTheme,
  BottomSheetThemeData? bottomSheetTheme,
  CardTheme? cardTheme,
  CheckboxThemeData? checkboxTheme,
  ChipThemeData? chipTheme,
  DataTableThemeData? dataTableTheme,
  DatePickerThemeData? datePickerTheme,
  DialogTheme? dialogTheme,
  DividerThemeData? dividerTheme,
  DropdownMenuThemeData? dropdownMenuTheme,
  ElevatedButtonThemeData? elevatedButtontTheme,
  ExpansionTileThemeData? expansionTileTheme,
  FilledButtonThemeData? filledButtonTheme,
  FloatingActionButtonThemeData? floatingActionButtonTheme,
  IconButtonThemeData? iconButtonTheme,
  ListTileThemeData? listTileTheme,
  MenuBarThemeData? menuBarTheme,
  MenuThemeData? menuTheme,
  NavigationBarThemeData? navigationBarTheme,
  NavigationDrawerThemeData? navigationDrawerThemeData,
  NavigationRailThemeData? navigationRailTheme,
  OutlinedButtonThemeData? outlinedButtonTheme,
  PopupMenuThemeData? popupMenuTheme,
  ProgressIndicatorThemeData? progressIndicatorTheme,
  RadioThemeData? radioTheme,
  SearchBarThemeData? searchBarTheme,
  SearchViewThemeData? searchViewTheme,
  SegmentedButtonThemeData? segmentedButtonTheme,
  SliderThemeData? sliderTheme,
  SnackBarThemeData? snackbarTheme,
  SwitchThemeData? switchTheme,
  TabBarTheme? tabBarTheme,
  TextButtonThemeData? textButtonTheme,
  TextSelectionThemeData? textSelectionTheme,
  TimePickerThemeData? timePickerTheme,
  TooltipThemeData? tooltipTheme,
  ToggleButtonsThemeData? toggleButtonsTheme,
}) {
  // ThemeData autoconfigures this general config for these nullable parameters:
  //         curpertinoOverrideTheme
  //         extentions
  //         adaptations
  //         inputDecorationTheme
  //         platform
  //        materialTapTargetSize
  //       pageTransitionsTheme
  //       scrollbarTheme
  //        visualDensity
  //        useMaterial3
  //        useInkSparkle
  //        splashFactory

  // asserts for colorSchemeSeed or colorScheme
  //  asserts colorSchemeSeed or primarySwatch
  // asserts colorSchemeSeed or primarColor
  // which when one thing is not null sets up code to
  //      1. set colorScheme dark and not from defaults
  //       2. primarySurfaceColor as primaryColor (careful as this
  //           implies primaryColor needs to be set anyway)
  //       3. onPrimarySurfaceColor
  //       4. canvasColor
  //       5. scaffoldBackgroundColor
  //        6. cardColor
  //       7. dividerColor
  //        8. dialogBackgroundColor
  //        9. indicatorColor
  //        10. applyElevationOverlayColor
  //        11. estimatedPrimaryColorBrightness
  //         12.

  // under useMaterial3 true these are default value set if null to
  //    1. primarySurfaceColor if dark surface if light primary
  //    2. onPrimarySurfaceColor if dark onSurface if light onPrimary
  //    3.  primaryColor = primarySurfaceColor
  //    4. canvasColor = suirface
  //    5. scaffoldBackgorundColor = surface
  //    6. cardColor = surface
  //    7. dividerColor = outline
  //    8. dialogBackgroundColor = surface
  //    9. indicatorColor = onPrimarySurfaceColor
  //   10, applyElevatedOverlayColor is set to true if dark and false if light
  //
  // so since those are autoset upon useMaterial3 flag the ones that
  // are left to set are:
  //      focusColor
  //      highlightColor
  //      hintColor
  //      hoverColor
  //      secondaryHeaderColor
  //      shadorColor = fully opaque black
  //      splashColor
  //      unselectedwidgetColor
  //
  // as they are still default set to MD2 values if null and looks like best
  // way to proceed is to set them by component theme as then can subtract from
  // component theme when no longer needed.

  // need to implent better text and icon color parameter stuff
  // defaults the MD3 if null but othersiwer SchemeColor for
  // colors and shadow colors etc. And make sure all 
  // component theses that if SchemeColor parameters as 
  // null then set MD3 defaults.

  return ThemeData(
    brightness: brightness,
    colorScheme: colorScheme,
    adaptations: adaptations,
    extensions: extensions,
    applyElevationOverlayColor: applyElevationOverlayColor,
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,
    iconTheme: iconTheme,
    primaryIconTheme: primaryIconTheme,
    cupertinoOverrideTheme: cupertinoOverrideTheme,
    inputDecorationTheme: inputDecorationTheme,
    materialTapTargetSize: materialTapTargetSize,
    pageTransitionsTheme: pageTransitionsTheme,
    platform: platform,
    scrollbarTheme: scrollbarTheme,
    splashFactory: splashFactory,
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,

    actionIconTheme: actionIconTheme,
    appBarTheme: appBarTheme,
    badgeTheme: badgeTheme,
    bannerTheme: bannerTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    bottomSheetTheme: bottomSheetTheme,
    cardTheme: cardTheme,
    checkboxTheme: checkboxTheme,
    chipTheme: chipTheme,
    dataTableTheme: dataTableTheme,
    datePickerTheme: datePickerTheme,
    dialogTheme: dialogTheme,
    dividerTheme: dividerTheme,
    dropdownMenuTheme: dropdownMenuTheme,
    elevatedButtonTheme: elevatedButtontTheme,
    expansionTileTheme: expansionTileTheme,
    filledButtonTheme: filledButtonTheme,
    floatingActionButtonTheme: floatingActionButtonTheme,
    iconButtonTheme: iconButtonTheme,
    listTileTheme: listTileTheme,
    menuBarTheme: menuBarTheme,
    menuTheme: menuTheme,
    navigationBarTheme: navigationBarTheme,
    navigationDrawerTheme: navigationDrawerThemeData,
    navigationRailTheme: navigationRailTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    popupMenuTheme: popupMenuTheme,
    progressIndicatorTheme: progressIndicatorTheme,
    radioTheme: radioTheme,
    searchBarTheme: searchBarTheme,
    searchViewTheme: searchViewTheme,
    segmentedButtonTheme: segmentedButtonTheme,
    sliderTheme: sliderTheme,
    snackBarTheme: snackbarTheme,
    switchTheme: switchTheme,
    tabBarTheme: tabBarTheme,
    textButtonTheme: textButtonTheme,
    textSelectionTheme: textSelectionTheme,
    timePickerTheme: timePickerTheme,
    tooltipTheme: tooltipTheme,
    toggleButtonsTheme: toggleButtonsTheme,
  );
}
