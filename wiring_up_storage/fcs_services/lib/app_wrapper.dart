// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: deprecated_member_use

import 'package:dynamic_color/dynamic_color.dart';
import 'package:fcs_services/app_scroll_behavior.dart';
import 'package:fcs_services/controllers/theme_controller.dart';

import 'package:fcs_services/globals/app_globals.dart';
import 'package:fcs_services/my_home_page.dart';

import 'package:fcs_services/themes/build_color_scheme.dart';
import 'package:fcs_services/themes/build_flex_color_schemes.dart';
import 'package:fcs_services/themes/custom_core_palette_to_color_scheme.dart';
import 'package:fcs_services/themes/theme_tokens.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// What is different in the AppWrapper this
/// time around is that we have to
/// incorporate the DynamicColor builder
/// stuff as stateful ratther than builder as
/// we already have one builder in the form
/// of ListenableBuilder for our themeMode
/// stuff.
///
/// This is the technique used when we
/// have nested builders.
class AppWrapper extends StatefulWidget {
  const AppWrapper({super.key, required this.themeController});

  final ThemeController themeController;

  @override
  State<AppWrapper> createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  ColorScheme? _light;
  ColorScheme? _dark;

  @override
  void initState() {
    super.initState();
    // dynamic color builder stuff is in the initPlatformState()
    // function. This is done to nest a builder via
    // making the parent a stateful
    initPlatformState();
    colorSchemeProcessing();
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
        if (isDebug) {
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
      if (isDebug) {
        debugPrint('dynamic_color: Failed to obtain core palette.');
      }
    }

    try {
      final Color? accentColor = await DynamicColorPlugin.getAccentColor();

      // Likewise above.
      if (!mounted) return;

      if (accentColor != null) {
        if (isDebug) {
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
      if (isDebug) {
        debugPrint('dynamic_color: Failed to obtain accent color.');
      }
    }
    if (isDebug) {
      debugPrint('dynamic_color: Dynamic color not detected on this device.');
    }
  }

  // rest of color scheme processing
  // that needs to be done including
  // fallback color scheme and brand
  // color injection back into the
  // HCT color space as our brand colors
  // are in the RGBA color space.
  colorSchemeProcessing() {
    if (_light != null && _dark != null) {
      // dynamic color platforms, desktop and android
      // we need to inject brand colors back into hct and
      // color scheme
      _light?.copyWith(
        primaryFixed: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedBlend.value, _light!.primaryFixed.value)),
        primaryFixedDim: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedDimBlend.value, _light!.primaryFixed.value)),
        onPrimaryFixed: Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedBlend.value, _light!.onPrimaryFixed.value)),
        onPrimaryFixedVariant: Color(
            Blend.harmonize(ThemeTokens.appOnPrimaryFixedVariantBlend.value, _light!.onPrimaryFixedVariant.value),),
        secondaryFixed: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedBlend.value, _light!.secondaryFixed.value)),
        secondaryFixedDim:
            Color(Blend.harmonize(ThemeTokens.appSecondaryFixedDimBlend.value, _light!.secondaryFixedDim.value)),
        onSecondaryFixed:
            Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedBlend.value, _light!.onSecondaryFixed.value)),
        onSecondaryFixedVariant: Color(
            Blend.harmonize(ThemeTokens.appOnSecondaryFixedVariantBlend.value, _light!.onSecondaryFixedVariant.value),),
        tertiaryFixed: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedBlend.value, _light!.tertiaryFixed.value)),
        tertiaryFixedDim:
            Color(Blend.harmonize(ThemeTokens.appTertiaryFixedDimBlend.value, _light!.tertiaryFixedDim.value)),
        onTertiaryFixed:
            Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedBlend.value, _light!.onTertiaryFixed.value)),
        onTertiaryFixedVariant: Color(
            Blend.harmonize(ThemeTokens.appOnTertiaryFixedVariantBlend.value, _light!.onTertiaryFixedVariant.value),),
        error: Color(Blend.harmonize(ThemeTokens.appErrorBlend.value, _light!.error.value)),
        onError: Color(Blend.harmonize(ThemeTokens.appOnErrorBlend.value, _light!.onError.value)),
        errorContainer: Color(Blend.harmonize(ThemeTokens.appErrorContainerBlend.value, _light!.errorContainer.value)),
        onErrorContainer:
            Color(Blend.harmonize(ThemeTokens.appOnErrorContainerBlend.value, _light!.onErrorContainer.value)),
      );

      _dark?.copyWith(
        primaryFixed: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedBlend.value, _dark!.primaryFixed.value)),
        primaryFixedDim: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedDimBlend.value, _dark!.primaryFixed.value)),
        onPrimaryFixed: Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedBlend.value, _dark!.onPrimaryFixed.value)),
        onPrimaryFixedVariant:
            Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedVariantBlend.value, _dark!.onPrimaryFixedVariant.value)),
        secondaryFixed: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedBlend.value, -_dark!.secondaryFixed.value)),
        secondaryFixedDim:
            Color(Blend.harmonize(ThemeTokens.appSecondaryFixedDimBlend.value, _dark!.secondaryFixedDim.value)),
        onSecondaryFixed:
            Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedBlend.value, _dark!.onSecondaryFixed.value)),
        onSecondaryFixedVariant: Color(
            Blend.harmonize(ThemeTokens.appOnSecondaryFixedVariantBlend.value, _dark!.onSecondaryFixedVariant.value),),
        tertiaryFixed: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedBlend.value, _dark!.tertiaryFixed.value)),
        tertiaryFixedDim:
            Color(Blend.harmonize(ThemeTokens.appTertiaryFixedDimBlend.value, _dark!.tertiaryFixedDim.value)),
        onTertiaryFixed:
            Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedBlend.value, _dark!.onTertiaryFixed.value)),
        onTertiaryFixedVariant: Color(
            Blend.harmonize(ThemeTokens.appOnTertiaryFixedVariantBlend.value, _dark!.onTertiaryFixedVariant.value),),
        error: Color(Blend.harmonize(ThemeTokens.appErrorBlend.value, _dark!.error.value)),
        onError: Color(Blend.harmonize(ThemeTokens.appOnErrorBlend.value, _dark!.onError.value)),
        errorContainer: Color(Blend.harmonize(ThemeTokens.appErrorContainerBlend.value, _dark!.errorContainer.value)),
        onErrorContainer:
            Color(Blend.harmonize(ThemeTokens.appOnErrorContainerBlend.value, _dark!.onErrorContainer.value)),
      );
    } else {
      // fallback
      _light = buildColorScheme(
        appBrightness: Brightness.light,
        variant: ThemeTokens.appSchemeVariant,
        appPrimaryBrand: ThemeTokens.appPrimaryKey,
        appSecondaryBrand: ThemeTokens.appSecondaryKey,
        appTertiaryBrand: ThemeTokens.appTertiaryKey,
        appErrorBrand: ThemeTokens.appErrorKey,
        appNeutralBrand: ThemeTokens.appNeutralKey,
        appNeutralVariantBrand: ThemeTokens.appNeutralVariantKey,
        useExpressiveOnContainer: ThemeTokens.appUseExpressiveOnColors,
        // when useExpressOnContainer is true
        // I slightly adjust contrastLevel higher
        // to adjust to how Flex Seed Scheme
        // computes OnContainer colors
        // otherwise constantLevel is set to zero
        appContrastLevel: ThemeTokens.appStandardContrastLevel,
      );

      // brand color injection
      _light?.copyWith(
        primaryFixed: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedBlend.value, _light!.primaryFixed.value)),
        primaryFixedDim: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedDimBlend.value, _light!.primaryFixed.value)),
        onPrimaryFixed: Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedBlend.value, _light!.onPrimaryFixed.value)),
        onPrimaryFixedVariant: Color(
            Blend.harmonize(ThemeTokens.appOnPrimaryFixedVariantBlend.value, _light!.onPrimaryFixedVariant.value),),
        secondaryFixed: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedBlend.value, _light!.secondaryFixed.value)),
        secondaryFixedDim:
            Color(Blend.harmonize(ThemeTokens.appSecondaryFixedDimBlend.value, _light!.secondaryFixedDim.value)),
        onSecondaryFixed:
            Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedBlend.value, _light!.onSecondaryFixed.value)),
        onSecondaryFixedVariant: Color(
            Blend.harmonize(ThemeTokens.appOnSecondaryFixedVariantBlend.value, _light!.onSecondaryFixedVariant.value),),
        tertiaryFixed: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedBlend.value, _light!.tertiaryFixed.value)),
        tertiaryFixedDim:
            Color(Blend.harmonize(ThemeTokens.appTertiaryFixedDimBlend.value, _light!.tertiaryFixedDim.value)),
        onTertiaryFixed:
            Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedBlend.value, _light!.onTertiaryFixed.value)),
        onTertiaryFixedVariant: Color(
            Blend.harmonize(ThemeTokens.appOnTertiaryFixedVariantBlend.value, _light!.onTertiaryFixedVariant.value),),
        error: Color(Blend.harmonize(ThemeTokens.appErrorBlend.value, _light!.error.value)),
        onError: Color(Blend.harmonize(ThemeTokens.appOnErrorBlend.value, _light!.onError.value)),
        errorContainer: Color(Blend.harmonize(ThemeTokens.appErrorContainerBlend.value, _light!.errorContainer.value)),
        onErrorContainer:
            Color(Blend.harmonize(ThemeTokens.appOnErrorContainerBlend.value, _light!.onErrorContainer.value)),
      );

      _dark = buildColorScheme(
        appBrightness: Brightness.dark,
        variant: ThemeTokens.appSchemeVariant,
        appPrimaryBrand: ThemeTokens.appPrimaryKey,
        appSecondaryBrand: ThemeTokens.appSecondaryKey,
        appTertiaryBrand: ThemeTokens.appTertiaryKey,
        appErrorBrand: ThemeTokens.appErrorKey,
        appNeutralBrand: ThemeTokens.appNeutralKey,
        appNeutralVariantBrand: ThemeTokens.appNeutralVariantKey,
        useExpressiveOnContainer: ThemeTokens.appUseExpressiveOnColors,
        // when useExpressOnContainer is true
        // I slightly adjust contrastLevel higher
        // to adjust to how Flex Seed Scheme
        // computes OnContainer colors
        // otherwise constantLevel is set to zero
        appContrastLevel: ThemeTokens.appStandardContrastLevel,
      );

      _dark?.copyWith(
        primaryFixed: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedBlend.value, _dark!.primaryFixed.value)),
        primaryFixedDim: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedDimBlend.value, _dark!.primaryFixed.value)),
        onPrimaryFixed: Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedBlend.value, _dark!.onPrimaryFixed.value)),
        onPrimaryFixedVariant:
            Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedVariantBlend.value, _dark!.onPrimaryFixedVariant.value)),
        secondaryFixed: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedBlend.value, _dark!.secondaryFixed.value)),
        secondaryFixedDim:
            Color(Blend.harmonize(ThemeTokens.appSecondaryFixedDimBlend.value, _dark!.secondaryFixedDim.value)),
        onSecondaryFixed:
            Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedBlend.value, _dark!.onSecondaryFixed.value)),
        onSecondaryFixedVariant: Color(
            Blend.harmonize(ThemeTokens.appOnSecondaryFixedVariantBlend.value, _dark!.onSecondaryFixedVariant.value),),
        tertiaryFixed: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedBlend.value, _dark!.tertiaryFixed.value)),
        tertiaryFixedDim:
            Color(Blend.harmonize(ThemeTokens.appTertiaryFixedDimBlend.value, _dark!.tertiaryFixedDim.value)),
        onTertiaryFixed:
            Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedBlend.value, _dark!.onTertiaryFixed.value)),
        onTertiaryFixedVariant: Color(
            Blend.harmonize(ThemeTokens.appOnTertiaryFixedVariantBlend.value, _dark!.onTertiaryFixedVariant.value),),
        error: Color(Blend.harmonize(ThemeTokens.appErrorBlend.value, _dark!.error.value)),
        onError: Color(Blend.harmonize(ThemeTokens.appOnErrorBlend.value, _dark!.onError.value)),
        errorContainer: Color(Blend.harmonize(ThemeTokens.appErrorContainerBlend.value, _dark!.errorContainer.value)),
        onErrorContainer:
            Color(Blend.harmonize(ThemeTokens.appOnErrorContainerBlend.value, _dark!.onErrorContainer.value)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: widget.themeController,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Demo',
            theme: buildLightFlexColorScheme(context, _light!, defaultTargetPlatform),
            darkTheme: buildDarkFlexColorScheme(context, _dark!, defaultTargetPlatform),
            scrollBehavior: AppScrollBehavior(),
            themeMode: widget.themeController.themeMode,
            home: const MyHomePage(title: 'Demo'),
          );
        },
     
    );
  }
}
