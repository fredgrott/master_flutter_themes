// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:fss_way/app_brand_key_colors.dart';
import 'package:fss_way/build_color_scheme.dart';
import 'package:universal_platform/universal_platform.dart';

/// The model (colorscheme) data binder.
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

  final bool _isHighContrast = WidgetsBinding.instance.platformDispatcher.accessibilityFeatures.highContrast;

  final UniversalPlatformType _osPlatform = currentUniversalPlatform;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    switch (_osPlatform) {
      case UniversalPlatformType.Linux:
        _light = buildColorScheme(
          appBrightness: Brightness.light,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.fidelity,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );
        _dark = buildColorScheme(
          appBrightness: Brightness.dark,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.fidelity,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );

      case UniversalPlatformType.Web:
        _light = buildColorScheme(
          appBrightness: Brightness.light,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.fidelity,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );
        _dark = buildColorScheme(
          appBrightness: Brightness.dark,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.fidelity,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );

      case UniversalPlatformType.Fuchsia:
        _light = buildColorScheme(
          appBrightness: Brightness.light,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.rainbow,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );
        _dark = buildColorScheme(
          appBrightness: Brightness.dark,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.rainbow,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );

      case UniversalPlatformType.Windows:
        _light = buildColorScheme(
          appBrightness: Brightness.light,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.content,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );
        _dark = buildColorScheme(
          appBrightness: Brightness.dark,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.content,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );

      case UniversalPlatformType.MacOS:
        _light = buildColorScheme(
          appBrightness: Brightness.light,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.tonalSpot,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );
        _dark = buildColorScheme(
          appBrightness: Brightness.dark,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.tonalSpot,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );

      case UniversalPlatformType.Android:
        _light = buildColorScheme(
          appBrightness: Brightness.light,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.expressive,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );
        _dark = buildColorScheme(
          appBrightness: Brightness.dark,
          // for non-dynamic color solutions I set
          // scheme on a plaform basis with each
          // one different per platform
          variant: FlexSchemeVariant.expressive,
          appPrimaryBrand: appBrandKeyColorOne,
          appSecondaryBrand: appBrandKeyColorTwo,
          appTertiaryBrand: appBrandKeyColorThree,
          appErrorBrand: appBrandKeyColorOne,
          appNeutralBrand: appBrandKeyColorOne,
          appNeutralVariantBrand: appBrandKeyColorOne,
          useExpressiveOnContainer: true,
          // when useExpressOnContainer is true
          // I slightly adjust contrastLevel higher
          // to adjust to how Flex Seed Scheme
          // computes OnContainer colors
          // otherwise constantLevel is set to zero
          appContrastLevel: 0.25,
        );

      case UniversalPlatformType.IOS:
        if (_isHighContrast) {
          _light = buildColorScheme(
            appBrightness: Brightness.light,
            // for non-dynamic color solutions I set
            // scheme on a plaform basis with each
            // one different per platform
            variant: FlexSchemeVariant.tonalSpot,
            appPrimaryBrand: appBrandKeyColorOne,
            appSecondaryBrand: appBrandKeyColorTwo,
            appTertiaryBrand: appBrandKeyColorThree,
            appErrorBrand: appBrandKeyColorOne,
            appNeutralBrand: appBrandKeyColorOne,
            appNeutralVariantBrand: appBrandKeyColorOne,
            useExpressiveOnContainer: true,
            // when useExpressOnContainer is true
            // I slightly adjust contrastLevel higher
            // to adjust to how Flex Seed Scheme
            // computes OnContainer colors
            // otherwise constantLevel is set to zero
            appContrastLevel: 0.25,
          );
          _dark = buildColorScheme(
            appBrightness: Brightness.dark,
            // for non-dynamic color solutions I set
            // scheme on a plaform basis with each
            // one different per platform
            variant: FlexSchemeVariant.tonalSpot,
            appPrimaryBrand: appBrandKeyColorOne,
            appSecondaryBrand: appBrandKeyColorTwo,
            appTertiaryBrand: appBrandKeyColorThree,
            appErrorBrand: appBrandKeyColorOne,
            appNeutralBrand: appBrandKeyColorOne,
            appNeutralVariantBrand: appBrandKeyColorOne,
            useExpressiveOnContainer: true,
            // when useExpressOnContainer is true
            // I slightly adjust contrastLevel higher
            // to adjust to how Flex Seed Scheme
            // computes OnContainer colors
            // otherwise constantLevel is set to zero
            appContrastLevel: 1.0,
          );
        } else {
          _light = buildColorScheme(
            appBrightness: Brightness.light,
            // for non-dynamic color solutions I set
            // scheme on a plaform basis with each
            // one different per platform
            variant: FlexSchemeVariant.tonalSpot,
            appPrimaryBrand: appBrandKeyColorOne,
            appSecondaryBrand: appBrandKeyColorTwo,
            appTertiaryBrand: appBrandKeyColorThree,
            appErrorBrand: appBrandKeyColorOne,
            appNeutralBrand: appBrandKeyColorOne,
            appNeutralVariantBrand: appBrandKeyColorOne,
            useExpressiveOnContainer: true,
            // when useExpressOnContainer is true
            // I slightly adjust contrastLevel higher
            // to adjust to how Flex Seed Scheme
            // computes OnContainer colors
            // otherwise constantLevel is set to zero
            appContrastLevel: 0.25,
          );
          _dark = buildColorScheme(
            appBrightness: Brightness.dark,
            // for non-dynamic color solutions I set
            // scheme on a plaform basis with each
            // one different per platform
            variant: FlexSchemeVariant.tonalSpot,
            appPrimaryBrand: appBrandKeyColorOne,
            appSecondaryBrand: appBrandKeyColorTwo,
            appTertiaryBrand: appBrandKeyColorThree,
            appErrorBrand: appBrandKeyColorOne,
            appNeutralBrand: appBrandKeyColorOne,
            appNeutralVariantBrand: appBrandKeyColorOne,
            useExpressiveOnContainer: true,
            // when useExpressOnContainer is true
            // I slightly adjust contrastLevel higher
            // to adjust to how Flex Seed Scheme
            // computes OnContainer colors
            // otherwise constantLevel is set to zero
            appContrastLevel: 0.25,
          );
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_light, _dark);
  }
}
