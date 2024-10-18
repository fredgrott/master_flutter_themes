


import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:simple_scheme_way/app_brand_key_colors.dart';
import 'package:simple_scheme_way/build_color_scheme.dart';
import 'package:simple_scheme_way/build_scheme.dart';
import 'package:universal_platform/universal_platform.dart';


class PlatformAdaptiveColorSchemeBuilder extends StatefulWidget{
   const PlatformAdaptiveColorSchemeBuilder({
     super.key,
     required this.builder,
   });


  final Widget Function(
    ColorScheme? lightCSAdaptive,
    ColorScheme? darkCSAdaptive,
  ) builder;

  @override
  PlatformAdaptiveColorSchemeBuilderState createState() => PlatformAdaptiveColorSchemeBuilderState();
}

class PlatformAdaptiveColorSchemeBuilderState extends State<PlatformAdaptiveColorSchemeBuilder>{
  ColorScheme? _light;
  ColorScheme? _dark;
  

  late DynamicScheme _lightScheme;
  late DynamicScheme _darkScheme;

  final bool _isHighContrast = WidgetsBinding.instance.platformDispatcher.accessibilityFeatures.highContrast;

  
  final UniversalPlatformType _osPlatform = currentUniversalPlatform;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    switch (_osPlatform){
       case UniversalPlatformType.Linux:
           _lightScheme = buildScheme(
          variantChoice: Variant.fidelity,
          primaryKey: appBrandKeyColorOne,
          isDark: false,
        );

        _darkScheme = buildScheme(
          variantChoice: Variant.fidelity,
          primaryKey: appBrandKeyColorOne,
          isDark: true,
        );

        _light = buildColorScheme(
          scheme: _lightScheme,
          brightness: Brightness.light,
        );

        _dark = buildColorScheme(
          scheme: _darkScheme,
          brightness: Brightness.dark,
        );
      case UniversalPlatformType.Web:
         _lightScheme = buildScheme(
           variantChoice: Variant.fidelity,
           primaryKey: appBrandKeyColorOne,
           isDark: false,
         );

         _darkScheme = buildScheme(
           variantChoice: Variant.fidelity,
           primaryKey: appBrandKeyColorOne,
           isDark: true,
         );

          _light = buildColorScheme(
            scheme: _lightScheme,
            brightness: Brightness.light,
          );

          _dark = buildColorScheme(
            scheme: _darkScheme,
            brightness: Brightness.dark,
          );
      case UniversalPlatformType.Fuchsia:
          _lightScheme = buildScheme(
           variantChoice: Variant.rainbow,
           primaryKey: appBrandKeyColorOne,
           isDark: false,
         );

         _darkScheme = buildScheme(
           variantChoice: Variant.rainbow ,
           primaryKey: appBrandKeyColorOne,
           isDark: true,
         );

          _light = buildColorScheme(
            scheme: _lightScheme,
            brightness: Brightness.light,
          );

          _dark = buildColorScheme(
            scheme: _darkScheme,
            brightness: Brightness.dark,
          );

      case UniversalPlatformType.Windows:
          _lightScheme = buildScheme(
           variantChoice: Variant.content,
           primaryKey: appBrandKeyColorOne,
           isDark: false,
         );

         _darkScheme = buildScheme(
           variantChoice: Variant.content,
           primaryKey: appBrandKeyColorOne,
           isDark: true,
         );

          _light = buildColorScheme(
            scheme: _lightScheme,
            brightness: Brightness.light,
          );

          _dark = buildColorScheme(
            scheme: _darkScheme,
            brightness: Brightness.dark,
          );

      case UniversalPlatformType.MacOS:
          _lightScheme = buildScheme(
           variantChoice: Variant.tonalSpot ,
           primaryKey: appBrandKeyColorOne,
           isDark: false,
         );

         _darkScheme = buildScheme(
           variantChoice: Variant.tonalSpot,
           primaryKey: appBrandKeyColorOne,
           isDark: true,
         );

          _light = buildColorScheme(
            scheme: _lightScheme,
            brightness: Brightness.light,
          );

          _dark = buildColorScheme(
            scheme: _darkScheme,
            brightness: Brightness.dark,
          );

      case UniversalPlatformType.Android:
          _lightScheme = buildScheme(
           variantChoice: Variant.expressive ,
           primaryKey: appBrandKeyColorOne,
           isDark: false,
         );

         _darkScheme = buildScheme(
           variantChoice: Variant.expressive,
           primaryKey: appBrandKeyColorOne,
           isDark: true,
         );

          _light = buildColorScheme(
            scheme: _lightScheme,
            brightness: Brightness.light,
          );

          _dark = buildColorScheme(
            scheme: _darkScheme,
            brightness: Brightness.dark,
          );

      case UniversalPlatformType.IOS:
         if (_isHighContrast) {
             _lightScheme = buildScheme(
           variantChoice: Variant.tonalSpot,
           primaryKey: appBrandKeyColorOne,
           isDark: false,
           contrastLevel: 1.0,
         );

         _darkScheme = buildScheme(
           variantChoice: Variant.tonalSpot,
           primaryKey: appBrandKeyColorOne,
           isDark: true,
           contrastLevel: 1.0,
         );

          _light = buildColorScheme(
            scheme: _lightScheme,
            brightness: Brightness.light,
          );

          _dark = buildColorScheme(
            scheme: _darkScheme,
            brightness: Brightness.dark,
          );

          } else {

            _lightScheme = buildScheme(
           variantChoice: Variant.tonalSpot,
           primaryKey: appBrandKeyColorOne,
           isDark: false,
         );

         _darkScheme = buildScheme(
           variantChoice: Variant.tonalSpot,
           primaryKey: appBrandKeyColorOne,
           isDark: true,
         );

          _light = buildColorScheme(
            scheme: _lightScheme,
            brightness: Brightness.light,
          );

          _dark = buildColorScheme(
            scheme: _darkScheme,
            brightness: Brightness.dark,
          );

          }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_light, _dark);
  }


}
