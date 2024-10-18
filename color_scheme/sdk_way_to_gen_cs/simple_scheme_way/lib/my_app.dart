import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:simple_scheme_way/app_brand_key_colors.dart';

import 'package:simple_scheme_way/my_home_page.dart';
import 'package:simple_scheme_way/platform_adaptive_color_scheme_builder.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformAdaptiveColorSchemeBuilder(builder: (ColorScheme? lightCSAdaptive, ColorScheme? darkCSAdaptive) {
      // we can do the brand color adjust here
      lightCSAdaptive = lightCSAdaptive!.copyWith(
        // we want to hue shift the fixed accent colors
        // towards brand color only
        primaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.primaryFixed.value)),
        primaryFixedDim: Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.primaryFixedDim.value)),

        onPrimaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.onPrimaryFixed.value)),

        onPrimaryFixedVariant:
            Color(Blend.harmonize(appBrandKeyColorOne.value, lightCSAdaptive.onPrimaryFixedVariant.value)),
      );

      darkCSAdaptive = darkCSAdaptive!.copyWith(
        primaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.primaryFixed.value)),
        primaryFixedDim: Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.primaryFixedDim.value)),
        onPrimaryFixed: Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.onPrimaryFixed.value)),
        onPrimaryFixedVariant:
            Color(Blend.harmonize(appBrandKeyColorOne.value, darkCSAdaptive.onPrimaryFixedVariant.value)),
      );

      return MaterialApp(
        theme: ThemeData(
          colorScheme: lightCSAdaptive,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: darkCSAdaptive,
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
      );
    },);
  }
}
