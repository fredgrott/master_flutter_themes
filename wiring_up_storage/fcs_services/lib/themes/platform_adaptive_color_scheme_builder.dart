// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:dynamic_color/dynamic_color.dart';
import 'package:fcs_services/themes/build_color_scheme.dart';
import 'package:fcs_services/themes/custom_core_palette_to_color_scheme.dart';
import 'package:fcs_services/themes/theme_tokens.dart';



import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_io/io.dart' as plat;



bool isDesk = plat.Platform.isMacOS || plat.Platform.isWindows || plat.Platform.isLinux;

bool isAndroidOrFuchsia = plat.Platform.isAndroid || plat.Platform.isFuchsia;


/// The model (colorscheme) data binder.
/// For dynamic color this set where on Android
/// one grabs the corePalette(scheme) to generate
/// the color scheme whereas on non Android plaforms
/// the accent color is used as seed to generate the 
/// color scheme.
///
/// This builder uses Flex Seed Scheme to generate the 
/// color schemes.
///
/// @author Fredrick Allan Grott
class PlatformAdaptiveColorSchemeBuilder extends StatefulWidget {
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


class PlatformAdaptiveColorSchemeBuilderState extends State<PlatformAdaptiveColorSchemeBuilder> {
  ColorScheme? _light;
  ColorScheme? _dark;

  
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final CorePalette? corePalette = (await DynamicColorPlugin.getCorePalette()) as CorePalette?;

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) return;

      if (corePalette != null) {
        if (kDebugMode) {
          debugPrint('dynamic_color: Core palette detected.');
        }
        setState(() {
          _light = corePalette.toColorScheme();
          _dark = corePalette.toColorScheme(brightness: Brightness.dark);
        });
        return;
      }
    } on PlatformException {
      /// if testing then supply mock
      if (kDebugMode) {
         
        debugPrint('dynamic_color: Failed to obtain core palette.');
      }
    }

    try {
      final Color? accentColor = await DynamicColorPlugin.getAccentColor();

      // Likewise above.
      if (!mounted) return;

      if (accentColor != null) {
        if (kDebugMode) {
          debugPrint('dynamic_color: Accent color detected.');
        }
        setState(() {
          _light = buildColorScheme(
            appBrightness: Brightness.light,
            variant: ThemeTokens.appSchemeVariant,
            appPrimaryBrand: accentColor,
            useExpressiveOnContainer: ThemeTokens.appUseExpressiveOnColors,
            // when useExpressOnContainer is true
            // I slightly adjust contrastLevel higher
            // to adjust to how Flex Seed Scheme
            // computes OnContainer colors
            // otherwise constantLevel is set to zero
            appContrastLevel: ThemeTokens.appStandardContrastLevel,
          );

          _dark = buildColorScheme(
            appBrightness: Brightness.dark,
            variant: ThemeTokens.appSchemeVariant,
            appPrimaryBrand: accentColor,
            useExpressiveOnContainer: ThemeTokens.appUseExpressiveOnColors,
            // when useExpressOnContainer is true
            // I slightly adjust contrastLevel higher
            // to adjust to how Flex Seed Scheme
            // computes OnContainer colors
            // otherwise constantLevel is set to zero
            appContrastLevel: ThemeTokens.appStandardContrastLevel,
          );

        });
        return;
      }
    } on PlatformException {
      // if texting supply mock
      if (kDebugMode) {
        
        debugPrint('dynamic_color: Failed to obtain accent color.');
      }
    }
    if (kDebugMode) {
      debugPrint('dynamic_color: Dynamic color not detected on this device.');
    }
  }



  @override
  Widget build(BuildContext context) {
    return widget.builder(_light, _dark);
  }
}
