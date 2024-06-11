// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flex_seed_scheme_tones/color_seeds.dart';
import 'package:flutter/material.dart';




final ColorScheme schemeDarkHighContrast = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
      // Primary key color is required, like seed color ColorScheme.fromSeed.
      primaryKey: primarySeedColor,
      // You can add optional own seeds for secondary and tertiary key colors.
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      // Tone chroma config and tone mapping is optional, if you do not add it
      // you get the config matching Flutter's Material 3 ColorScheme.fromSeed.
      tones: FlexTones.ultraContrast(Brightness.dark),

);
