// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

/// This is an opionated reading of what
/// Flex Seed Scheme settings should be
/// use for Material Design 3 adherence.
///
/// Unlike with MCU we do not have to manually
/// build the Dynamic Scheme as Flex Seed Scheme
/// takes care of that task due to that
/// package using MCU internally.
///
/// My Design Assumptions with Flex Seed Scheme
/// are:
/// 1. No longer using Flex Seed Scheme Custom Tones
///    but instead using MCU Schemes via Flex Seed Scheme
/// 2. I keep FSS repsectMonochromeSeed set to false
/// 3. I use dim and fixed and MCU blend to insert
///    brand colors into the HCT color space for brand
///    colors which is why I do not override colors
///    via the color parameters in the SeedColorScheme.fromSeeds
///    method.
/// 4. I use contrast level to set high contrast for
///    the iOS platform.
///
/// @author Fredrick Allan Grott
ColorScheme buildColorScheme({
  required Brightness appBrightness,
  required Color appPrimaryBrand,
  Color? appSecondaryBrand,
  Color? appTertiaryBrand,
  Color? appErrorBrand,
  Color? appNeutralBrand,
  Color? appNeutralVariantBrand,
  required FlexSchemeVariant variant,
  required bool useExpressiveOnContainer,
  required double appContrastLevel,
}) {
  return SeedColorScheme.fromSeeds(
    brightness: appBrightness,
    primaryKey: appPrimaryBrand,
    secondaryKey: appSecondaryBrand,
    tertiaryKey: appTertiaryBrand,
    errorKey: appErrorBrand,
    neutralKey: appNeutralBrand,
    neutralVariantKey: appNeutralVariantBrand,
    variant: variant,
    contrastLevel: appContrastLevel,
    useExpressiveOnContainerColors: useExpressiveOnContainer,
  );
}

