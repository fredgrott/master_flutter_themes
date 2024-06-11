// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_seed_scheme_variants/app_light_text_theme.dart';
import 'package:flex_seed_scheme_variants/app_dark_text_theme.dart';
import 'package:flex_seed_scheme_variants/app_light_primary_text_theme.dart';
import 'package:flex_seed_scheme_variants/app_dark_primary_text_theme.dart';



import 'package:flex_seed_scheme_variants/my_home_page.dart';
import 'package:flex_seed_scheme_variants/scheme_dark.dart';
import 'package:flex_seed_scheme_variants/scheme_dark_high_contrast.dart';
import 'package:flex_seed_scheme_variants/scheme_high_contrast.dart';
import 'package:flex_seed_scheme_variants/scheme_light.dart';
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
        primaryTextTheme: appLightPrimaryTextTheme(schemeLight.primary),
        
      ),
      highContrastTheme: ThemeData(
        colorScheme: schemeHighContrast,
        useMaterial3: true,
        textTheme: appLightTextTheme,
        primaryTextTheme: appLightPrimaryTextTheme(schemeHighContrast.primary),
       
      ),
      darkTheme: ThemeData(
        colorScheme: schemeDark,
        useMaterial3: true,
        textTheme: appDarkTextTheme,
        primaryTextTheme: appDarkPrimaryTextTheme(schemeDark.primary),
        
      ),
      highContrastDarkTheme: ThemeData(
        colorScheme: schemeDarkHighContrast,
        useMaterial3: true,
        textTheme: appDarkTextTheme,
        primaryTextTheme: appDarkPrimaryTextTheme(schemeDarkHighContrast.primary),
        
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
