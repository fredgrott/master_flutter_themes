// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:raw_md3_demo/constants.dart';
import 'package:raw_md3_demo/home.dart';

final List _allList = [
  'assets/images/content_based_color_scheme_1.png',
  'assets/images/content_based_color_scheme_2.png',
  'assets/images/content_based_color_scheme_3.png',
  'assets/images/content_based_color_scheme_4.png',
  'assets/images/content_based_color_scheme_5.png',
  'assets/images/content_based_color_scheme_6.png',
];

void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();

  // pre cache images in assets for
  // many purposes including splash, etc.
  binding.deferFirstFrame();
  binding.addPostFrameCallback((_) async {
    final BuildContext context = binding.rootElement! as BuildContext;
    for (final asset in _allList) {
      precacheImage(AssetImage(asset as String), context);
    }
      binding.allowFirstFrame();
  });

  runApp(const App());
}

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
      theme: ThemeData(
        colorSchemeSeed: colorSelectionMethod == ColorSelectionMethod.colorSeed ? colorSelected.color : null,
        colorScheme: colorSelectionMethod == ColorSelectionMethod.image ? imageColorScheme : null,
        useMaterial3: useMaterial3,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed:
            colorSelectionMethod == ColorSelectionMethod.colorSeed ? colorSelected.color : imageColorScheme!.primary,
        useMaterial3: useMaterial3,
        brightness: Brightness.dark,
      ),
      
      // So why we need this set?
      // It not only sets the theme mode change animation,
      // it also sets the animation of:
      //           MaterialApp-themeMode animation it sets themeAnimationDuration and 
      //              themeAnimationCurve which is why I did not set them
      //           ExpansionTile
      //          PopupMenuButton
      //         Scaffold showSnackBar
      //           show BottomSheet
      //          show ModalBottomSheet
      themeAnimationStyle: AnimationStyle(
        curve:  Curves.easeInBack,
        duration: Durations.long3,
        reverseCurve: Curves.bounceIn,
        reverseDuration: Durations.long1,
      ),
      home: Home(
        useLightMode: useLightMode,
        useMaterial3: useMaterial3,
        colorSelected: colorSelected,
        imageSelected: imageSelected,
        handleBrightnessChange: handleBrightnessChange,
        handleMaterialVersionChange: handleMaterialVersionChange,
        handleColorSelect: handleColorSelect,
        handleImageSelect: handleImageSelect,
        colorSelectionMethod: colorSelectionMethod,
      ),
    );
  }
}
