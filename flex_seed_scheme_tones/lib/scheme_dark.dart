// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flex_seed_scheme_tones/color_seeds.dart';
import 'package:flutter/material.dart';

// Note: Flutter SDK 3.22 and beyond passes a
//       scheme variant that lines up with Android native
//       thus to deal with dynamic colors its better 
//       to use non custom tones.


final ColorScheme schemeDark = SeedColorScheme.fromSeeds(
      brightness: Brightness.dark,
      primaryKey: primarySeedColor,
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      tones: FlexTones.material(Brightness.dark),
    );

