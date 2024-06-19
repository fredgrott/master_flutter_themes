// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

//tODO: Re-do when the contrastLevels in the FSS package land.

/// With the Flex Seed Scheme and Flex Color Scheme packages this is the 
/// way to create a Flutter SDK ColorScheme with brand colors in that the 
/// brand color is made a primaryContainer color adjusted +5 tone light and 
/// -5 tone dark as the variant content  is what makes that work.
/// 
/// @author Fredrick Allan Grott
ColorScheme colorSchemeLogoDark(Color logoColor) => SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
  primaryKey: logoColor,
  variant: FlexSchemeVariant.content,
  );
