// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_seed_scheme_demo/app_light_text_theme.dart';
import 'package:flex_seed_scheme_demo/app_dark_text_theme.dart';
import 'package:flex_seed_scheme_demo/app_primary_text_theme.dart';
import 'package:flex_seed_scheme_demo/brand_colors.dart';
import 'package:flex_seed_scheme_demo/color_schemes.dart';
import 'package:flex_seed_scheme_demo/custom_brand_colors.dart';
import 'package:flex_seed_scheme_demo/my_home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flex Seed Scheme Demo',
      theme: ThemeData(
        colorScheme: schemeLight,
        useMaterial3: true,
        textTheme: appLightTextTheme,
        primaryTextTheme: appPrimaryTextTheme(schemeLight.primary),
        extensions: <ThemeExtension<dynamic>>[
          BrandColors(
            brandColorOne: rawBrandColorOneLight,
            brandColorTwo: rawBrandColorTwoLight,
            brandColorThree: rawBrandColorThreeLight,
          ),
        ],
      ),
      highContrastTheme: ThemeData(
        colorScheme: schemeHighContrast,
        useMaterial3: true,
        textTheme: appLightTextTheme,
        primaryTextTheme: appPrimaryTextTheme(schemeHighContrast.primary),
        extensions: <ThemeExtension<dynamic>>[
          BrandColors(
            brandColorOne: rawBrandColorOneLight,
            brandColorTwo: rawBrandColorTwoLight,
            brandColorThree: rawBrandColorThreeLight,
          ),
        ],
      ),
      darkTheme: ThemeData(
        colorScheme: schemeDark,
        useMaterial3: true,
        textTheme: appDarkTextTheme,
        primaryTextTheme: appPrimaryTextTheme(schemeDark.primary),
        extensions: <ThemeExtension<dynamic>>[
          BrandColors(
            brandColorOne: rawBrandColorOneDark,
            brandColorTwo: rawBrandColorTwoDark,
            brandColorThree: rawBrandColorThreeDark,
          ),
        ],
      ),
      highContrastDarkTheme: ThemeData(
        colorScheme: schemeDarkHighContrast,
        useMaterial3: true,
        textTheme: appDarkTextTheme,
        primaryTextTheme: appPrimaryTextTheme(schemeDarkHighContrast.primary),
        extensions: <ThemeExtension<dynamic>>[
          BrandColors(
            brandColorOne: rawBrandColorOneDark,
            brandColorTwo: rawBrandColorTwoDark,
            brandColorThree: rawBrandColorThreeDark,
          ),
        ],
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
