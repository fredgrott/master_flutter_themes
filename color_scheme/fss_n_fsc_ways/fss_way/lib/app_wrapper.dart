// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:fss_way/app_brand_key_colors.dart';
import 'package:fss_way/app_icon_themes.dart';
import 'package:fss_way/app_scroll_behavior.dart';
import 'package:fss_way/app_text_themes.dart';
import 'package:fss_way/my_home_page.dart';
import 'package:fss_way/platform_adaptive_color_scheme_builder.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformAdaptiveColorSchemeBuilder(
      builder: (ColorScheme? lightCSAdaptive, ColorScheme? darkCSAdaptive) {
        // copyWith is use to inject brand colors
        // back into the HCT color space using
        // MCU Blend.harmonize method
        lightCSAdaptive?.copyWith(
          primaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.primaryFixed.value)),
          primaryFixedDim: Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.primaryFixedDim.value)),
          onPrimaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.onPrimaryFixed.value)),
          onPrimaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.onPrimaryFixedVariant.value)),
          secondaryFixed: Color(Blend.harmonize(appBrandKeyColorTwo.value, lightCSAdaptive.secondaryFixed.value)),
          secondaryFixedDim: Color(Blend.harmonize(appBrandKeyColorTwo.value, lightCSAdaptive.secondaryFixedDim.value)),
          onSecondaryFixed: Color(Blend.harmonize(appBrandKeyColorTwo.value, lightCSAdaptive.onSecondaryFixed.value)),
          onSecondaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorTwo.value, lightCSAdaptive.onSecondaryFixedVariant.value)),
          tertiaryFixed: Color(Blend.harmonize(appBrandKeyColorThree.value, lightCSAdaptive.tertiaryFixed.value)),
          tertiaryFixedDim: Color(Blend.harmonize(appBrandKeyColorThree.value, lightCSAdaptive.tertiaryFixedDim.value)),
          onTertiaryFixed: Color(Blend.harmonize(appBrandKeyColorThree.value, lightCSAdaptive.onTertiaryFixed.value)),
          onTertiaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorThree.value, lightCSAdaptive.onTertiaryFixedVariant.value)),
        );

        darkCSAdaptive?.copyWith(
          primaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.primaryFixed.value)),
          primaryFixedDim: Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.primaryFixedDim.value)),
          onPrimaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.onPrimaryFixed.value)),
          onPrimaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.onPrimaryFixedVariant.value)),
          secondaryFixed: Color(Blend.harmonize(appBrandKeyColorTwo.value, darkCSAdaptive.secondaryFixed.value)),
          secondaryFixedDim: Color(Blend.harmonize(appBrandKeyColorTwo.value, darkCSAdaptive.secondaryFixedDim.value)),
          onSecondaryFixed: Color(Blend.harmonize(appBrandKeyColorTwo.value, darkCSAdaptive.onSecondaryFixed.value)),
          onSecondaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorTwo.value, darkCSAdaptive.onSecondaryFixedVariant.value)),
          tertiaryFixed: Color(Blend.harmonize(appBrandKeyColorThree.value, darkCSAdaptive.tertiaryFixed.value)),
          tertiaryFixedDim: Color(Blend.harmonize(appBrandKeyColorThree.value, darkCSAdaptive.tertiaryFixedDim.value)),
          onTertiaryFixed: Color(Blend.harmonize(appBrandKeyColorThree.value, darkCSAdaptive.onTertiaryFixed.value)),
          onTertiaryFixedVariant:
              Color(Blend.harmonize(appBrandKeyColorThree.value, darkCSAdaptive.onTertiaryFixedVariant.value)),
        );

        return MaterialApp(
          theme: ThemeData(
            colorScheme: lightCSAdaptive,
            useMaterial3: true,
            textTheme: appTextTheme(context),
            primaryTextTheme: appPrimaryTextTheme(context),
            iconTheme: appIconThemeData(context),
            primaryIconTheme: appPrimaryIconThemeData(context),
          ),
          darkTheme: ThemeData(
            colorScheme: darkCSAdaptive,
            useMaterial3: true,
            textTheme: appTextTheme(context),
            primaryTextTheme: appPrimaryTextTheme(context),
            iconTheme: appIconThemeData(context),
            primaryIconTheme: appPrimaryIconThemeData(context),
          ),
          scrollBehavior: AppScrollBehavior(),
          themeMode: ThemeMode.dark,
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}
