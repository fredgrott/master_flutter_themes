// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flex_seed_scheme/flex_seed_scheme.dart';

import 'package:flutter/material.dart';

//TODO: Re-do when contrastLevels make into Flex Seed Scheme

ColorScheme colorSchemeDark(Color seedColor) {
  return SeedColorScheme.fromSeeds(
    brightness: Brightness.dark,
    primaryKey: seedColor,
    variant: FlexSchemeVariant.vividSurfaces,
  );
}
