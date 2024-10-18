import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:sdk_way_mcu/build_color_scheme.dart';
import 'package:sdk_way_mcu/build_dynamic_scheme.dart';
import 'package:sdk_way_mcu/my_home_page.dart';



Color brandColor = const Color(0xffcbc3e3);
DynamicScheme myLightScheme = buildDynamicScheme(brightness: Brightness.light, variant: DynamicSchemeVariant.fidelity, primarySeedColor:  brandColor);
DynamicScheme myDarkScheme = buildDynamicScheme(brightness: Brightness.dark, variant: DynamicSchemeVariant.fidelity, primarySeedColor:  brandColor);
ColorScheme lightColorScheme = buildColorScheme(scheme: myLightScheme);
ColorScheme darkColorScheme = buildColorScheme(scheme: myDarkScheme);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: lightColorScheme.copyWith(
          // in HCT color space we always have a blend brand ARGB color with HCT gen color
          // to re insert brand color into ColorScheme
          primaryFixed: Color(Blend.harmonize(brandColor.value, lightColorScheme.primaryFixed.value)),
          primaryFixedDim: Color(Blend.harmonize(brandColor.value, lightColorScheme.primaryFixedDim.value)) ,
          onPrimaryFixed: Color(Blend.harmonize(brandColor.value, lightColorScheme.onPrimaryFixed.value)),
          onPrimaryFixedVariant: Color(Blend.harmonize(brandColor.value, lightColorScheme.onPrimaryFixedVariant.value)),
          error: Color(Blend.harmonize(brandColor.value, lightColorScheme.error.value)),
          errorContainer: Color(Blend.harmonize(brandColor.value, lightColorScheme.errorContainer.value)),
          onError: Color(Blend.harmonize(brandColor.value, lightColorScheme.onError.value)),
          onErrorContainer: Color(Blend.harmonize(brandColor.value, lightColorScheme.onErrorContainer.value)),
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme.copyWith(
          primaryFixed: Color(Blend.harmonize(brandColor.value, darkColorScheme.primaryFixed.value)),
          primaryFixedDim: Color(Blend.harmonize(brandColor.value, darkColorScheme.primaryFixedDim.value)),
          onPrimaryFixed: Color(Blend.harmonize(brandColor.value, darkColorScheme.onPrimaryFixed.value)),
          onPrimaryFixedVariant: Color(Blend.harmonize(brandColor.value, darkColorScheme.onPrimaryFixedVariant.value)),
          error: Color(Blend.harmonize(brandColor.value, darkColorScheme.error.value)),
          errorContainer: Color(Blend.harmonize(brandColor.value, darkColorScheme.errorContainer.value)),
          onError: Color(Blend.harmonize(brandColor.value, darkColorScheme.onError.value)),
          onErrorContainer: Color(Blend.harmonize(brandColor.value, darkColorScheme.onErrorContainer.value)),
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
