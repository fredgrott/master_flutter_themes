// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:raw_md3_demo/app_vars.dart';
import 'package:raw_md3_demo/constants.dart';
import 'package:raw_md3_demo/home.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool useMaterial3 = true;
  ThemeMode themeMode = ThemeMode.system;
  ColorSeed colorSelected = ColorSeed.baseColor;
  ColorImageProvider imageSelected = ColorImageProvider.leaves;
  ColorScheme? imageColorScheme = const ColorScheme.light();
  ColorSelectionMethod colorSelectionMethod = ColorSelectionMethod.colorSeed;

  bool get useLightMode => switch (themeMode) {
        ThemeMode.system => View.of(context).platformDispatcher.platformBrightness == Brightness.light,
        ThemeMode.light => true,
        ThemeMode.dark => false
      };

  void handleBrightnessChange(bool useLightMode) {
    setState(() {
      themeMode = useLightMode ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void handleMaterialVersionChange() {
    setState(() {
      useMaterial3 = !useMaterial3;
    });
  }

  void handleColorSelect(int value) {
    setState(() {
      colorSelectionMethod = ColorSelectionMethod.colorSeed;
      colorSelected = ColorSeed.values[value];
    });
  }

  void handleImageSelect(int value) {
    final String url = ColorImageProvider.values[value].url;
    // NetworkImage changed to AssetImage
    ColorScheme.fromImageProvider(provider: AssetImage(url)).then((newScheme) {
      setState(() {
        colorSelectionMethod = ColorSelectionMethod.image;
        imageSelected = ColorImageProvider.values[value];
        imageColorScheme = newScheme;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    appLightTheme = ThemeData(
      colorSchemeSeed: colorSelectionMethod == ColorSelectionMethod.colorSeed ? colorSelected.color : null,
      colorScheme: colorSelectionMethod == ColorSelectionMethod.image ? imageColorScheme : null,
      useMaterial3: useMaterial3,
      brightness: Brightness.light,
    );

    appDarkTheme = ThemeData(
      colorSchemeSeed:
          colorSelectionMethod == ColorSelectionMethod.colorSeed ? colorSelected.color : imageColorScheme!.primary,
      useMaterial3: useMaterial3,
      brightness: Brightness.dark,
    );

    // for theme animation during ThemeMode change
    return MaterialApp(
      restorationScopeId: "MaterialDesign3Demo",
      debugShowCheckedModeBanner: false,
      title: 'Material 3',
      // usually need to modify this slightly depending upon
      // which devices are being targeted. In this case default
      // SDK wise does not add mouse, whereas I do due to
      // targeting desktop platforms.
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          /*Add this*/
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown,
        },
      ),
      themeMode: themeMode,
      // note in highContrast platforms highContrast theme comes from
      // the theme parameter and darkHighContrast ttheme comes from
      // darkTheme if those slots are not filled.
      theme: appLightTheme,
      darkTheme: appDarkTheme,
      
      // AnimationStyle gets used in these widgets:
      //         MaterialApp
      //         ExpansionTile
      //         PopupMenuButton
      //         ScaffoldMessengerState.showSnackBar
      //         showBottomSheet
      //         showModalBottomSheet
      themeAnimationStyle: AnimationStyle(
        curve: Curves.easeInOutCubicEmphasized,
        duration: Durations.extralong1,
        // note MaterialApp is the widget that 
        // does not implement reverse  for
        // theme animation whereas the 
        // other listed widget do for their animation 
        // using AnimationStyle
      ),
      // need to call the theme transition where
      // the shared scaffold resides

      
      
      home: Home(useLightMode: useLightMode, 
        useMaterial3: useMaterial3, 
        colorSelected: colorSelected, 
        handleBrightnessChange: handleBrightnessChange, 
        handleMaterialVersionChange: handleMaterialVersionChange, 
        handleColorSelect: handleColorSelect, 
        handleImageSelect: handleImageSelect, 
        colorSelectionMethod: colorSelectionMethod, 
        imageSelected: imageSelected,
      ),
    );
  }
}
