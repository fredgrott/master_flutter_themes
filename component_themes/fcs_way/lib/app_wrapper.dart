


import 'package:fcs_way/app_scroll_behavior.dart';
import 'package:fcs_way/my_home_page.dart';
import 'package:fcs_way/themes/build_color_scheme.dart';
import 'package:fcs_way/themes/build_flex_color_schemes.dart';
import 'package:fcs_way/themes/platform_adaptive_color_scheme_builder.dart';
import 'package:fcs_way/themes/theme_tokens.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return PlatformAdaptiveColorSchemeBuilder(
      builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme? lightColorScheme = lightDynamic;
        ColorScheme? darkColorScheme = darkDynamic;

        if (lightDynamic != null && darkDynamic != null) {
          // dynamic color platforms, desktop and android
          // we need to inject brand colors back into hct and 
          // color scheme
          lightColorScheme?.copyWith(
            primaryFixed: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedBlend.value, lightColorScheme.primaryFixed.value)),
            primaryFixedDim: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedDimBlend.value, lightColorScheme.primaryFixed.value)),
            onPrimaryFixed:  Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedBlend.value, lightColorScheme.onPrimaryFixed.value)),
            onPrimaryFixedVariant:Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedVariantBlend.value, lightColorScheme.onPrimaryFixedVariant.value)),
            secondaryFixed: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedBlend.value, lightColorScheme.secondaryFixed.value)),
            secondaryFixedDim: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedDimBlend.value, lightColorScheme.secondaryFixedDim.value)),
            onSecondaryFixed: Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedBlend.value, lightColorScheme.onSecondaryFixed.value)),
            onSecondaryFixedVariant: Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedVariantBlend.value, lightColorScheme.onSecondaryFixedVariant.value)),
            tertiaryFixed: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedBlend.value, lightColorScheme.tertiaryFixed.value)),
            tertiaryFixedDim: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedDimBlend.value, lightColorScheme.tertiaryFixedDim.value)),
            onTertiaryFixed: Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedBlend.value, lightColorScheme.onTertiaryFixed.value)),
            onTertiaryFixedVariant: Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedVariantBlend.value, lightColorScheme.onTertiaryFixedVariant.value)),
            error: Color(Blend.harmonize(ThemeTokens.appErrorBlend.value, lightColorScheme.error.value)),
            onError: Color(Blend.harmonize(ThemeTokens.appOnErrorBlend.value, lightColorScheme.onError.value)),
            errorContainer: Color(Blend.harmonize(ThemeTokens.appErrorContainerBlend.value, lightColorScheme.errorContainer.value)),
            onErrorContainer: Color(Blend.harmonize(ThemeTokens.appOnErrorContainerBlend.value, lightColorScheme.onErrorContainer.value)),

          );

          darkColorScheme?.copyWith(
            primaryFixed: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedBlend.value, darkColorScheme.primaryFixed.value)),
            primaryFixedDim: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedDimBlend.value, darkColorScheme.primaryFixed.value)),
            onPrimaryFixed:  Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedBlend.value, darkColorScheme.onPrimaryFixed.value)),
            onPrimaryFixedVariant:Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedVariantBlend.value, darkColorScheme.onPrimaryFixedVariant.value)),
            secondaryFixed: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedBlend.value, darkColorScheme.secondaryFixed.value)),
            secondaryFixedDim: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedDimBlend.value, darkColorScheme.secondaryFixedDim.value)),
            onSecondaryFixed: Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedBlend.value, darkColorScheme.onSecondaryFixed.value)),
            onSecondaryFixedVariant: Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedVariantBlend.value, darkColorScheme.onSecondaryFixedVariant.value)),
            tertiaryFixed: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedBlend.value, darkColorScheme.tertiaryFixed.value)),
            tertiaryFixedDim: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedDimBlend.value, darkColorScheme.tertiaryFixedDim.value)),
            onTertiaryFixed: Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedBlend.value, darkColorScheme.onTertiaryFixed.value)),
            onTertiaryFixedVariant: Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedVariantBlend.value, darkColorScheme.onTertiaryFixedVariant.value)),
            error: Color(Blend.harmonize(ThemeTokens.appErrorBlend.value, darkColorScheme.error.value)),
            onError: Color(Blend.harmonize(ThemeTokens.appOnErrorBlend.value, darkColorScheme.onError.value)),
            errorContainer: Color(Blend.harmonize(ThemeTokens.appErrorContainerBlend.value, darkColorScheme.errorContainer.value)),
            onErrorContainer: Color(Blend.harmonize(ThemeTokens.appOnErrorContainerBlend.value, darkColorScheme.onErrorContainer.value)),

          );
        } else {
          // fallback
          lightColorScheme = buildColorScheme(
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
          lightColorScheme.copyWith(
            primaryFixed: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedBlend.value, lightColorScheme.primaryFixed.value)),
            primaryFixedDim: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedDimBlend.value, lightColorScheme.primaryFixed.value)),
            onPrimaryFixed:  Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedBlend.value, lightColorScheme.onPrimaryFixed.value)),
            onPrimaryFixedVariant:Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedVariantBlend.value, lightColorScheme.onPrimaryFixedVariant.value)),
            secondaryFixed: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedBlend.value, lightColorScheme.secondaryFixed.value)),
            secondaryFixedDim: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedDimBlend.value, lightColorScheme.secondaryFixedDim.value)),
            onSecondaryFixed: Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedBlend.value, lightColorScheme.onSecondaryFixed.value)),
            onSecondaryFixedVariant: Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedVariantBlend.value, lightColorScheme.onSecondaryFixedVariant.value)),
            tertiaryFixed: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedBlend.value, lightColorScheme.tertiaryFixed.value)),
            tertiaryFixedDim: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedDimBlend.value, lightColorScheme.tertiaryFixedDim.value)),
            onTertiaryFixed: Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedBlend.value, lightColorScheme.onTertiaryFixed.value)),
            onTertiaryFixedVariant: Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedVariantBlend.value, lightColorScheme.onTertiaryFixedVariant.value)),
            error: Color(Blend.harmonize(ThemeTokens.appErrorBlend.value, lightColorScheme.error.value)),
            onError: Color(Blend.harmonize(ThemeTokens.appOnErrorBlend.value, lightColorScheme.onError.value)),
            errorContainer: Color(Blend.harmonize(ThemeTokens.appErrorContainerBlend.value, lightColorScheme.errorContainer.value)),
            onErrorContainer: Color(Blend.harmonize(ThemeTokens.appOnErrorContainerBlend.value, lightColorScheme.onErrorContainer.value)),
          );

           darkColorScheme = buildColorScheme(
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
          
           darkColorScheme.copyWith(
            primaryFixed: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedBlend.value, darkColorScheme.primaryFixed.value)),
            primaryFixedDim: Color(Blend.harmonize(ThemeTokens.appPrimaryFixedDimBlend.value, darkColorScheme.primaryFixed.value)),
            onPrimaryFixed:  Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedBlend.value, darkColorScheme.onPrimaryFixed.value)),
            onPrimaryFixedVariant:Color(Blend.harmonize(ThemeTokens.appOnPrimaryFixedVariantBlend.value, darkColorScheme.onPrimaryFixedVariant.value)),
            secondaryFixed: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedBlend.value, darkColorScheme.secondaryFixed.value)),
            secondaryFixedDim: Color(Blend.harmonize(ThemeTokens.appSecondaryFixedDimBlend.value, darkColorScheme.secondaryFixedDim.value)),
            onSecondaryFixed: Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedBlend.value, darkColorScheme.onSecondaryFixed.value)),
            onSecondaryFixedVariant: Color(Blend.harmonize(ThemeTokens.appOnSecondaryFixedVariantBlend.value, darkColorScheme.onSecondaryFixedVariant.value)),
            tertiaryFixed: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedBlend.value, darkColorScheme.tertiaryFixed.value)),
            tertiaryFixedDim: Color(Blend.harmonize(ThemeTokens.appTertiaryFixedDimBlend.value, darkColorScheme.tertiaryFixedDim.value)),
            onTertiaryFixed: Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedBlend.value, darkColorScheme.onTertiaryFixed.value)),
            onTertiaryFixedVariant: Color(Blend.harmonize(ThemeTokens.appOnTertiaryFixedVariantBlend.value, darkColorScheme.onTertiaryFixedVariant.value)),
            error: Color(Blend.harmonize(ThemeTokens.appErrorBlend.value, darkColorScheme.error.value)),
            onError: Color(Blend.harmonize(ThemeTokens.appOnErrorBlend.value, darkColorScheme.onError.value)),
            errorContainer: Color(Blend.harmonize(ThemeTokens.appErrorContainerBlend.value, darkColorScheme.errorContainer.value)),
            onErrorContainer: Color(Blend.harmonize(ThemeTokens.appOnErrorContainerBlend.value, darkColorScheme.onErrorContainer.value)),
          );

        }

        return MaterialApp(
          title: 'Flutter Demo',
          theme:  buildLightFlexColorScheme(context, lightColorScheme!, defaultTargetPlatform) ,
          darkTheme: buildDarkFlexColorScheme(context, darkColorScheme!, defaultTargetPlatform)     ,
          scrollBehavior: AppScrollBehavior(),
          themeMode: ThemeTokens.appThemeMode,
          debugShowCheckedModeBanner: false,
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );

      },
    );


  }



}