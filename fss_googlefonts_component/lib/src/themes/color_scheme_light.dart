// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values



import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

//TODO: Re-do when contrastLevels makes into Flex Seed Scheme

ColorScheme colorSchemeLight(Color seedColor) {
  return SeedColorScheme.fromSeeds(
    brightness: Brightness.light,
    primaryKey: seedColor,
    variant: FlexSchemeVariant.vividSurfaces,
  );
}
