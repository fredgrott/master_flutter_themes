// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/material.dart';

//TODO: Re-do when contrastLevel of ColorScheme lands in beta

ColorScheme colorSchemeLight(Color seedColor) {
  return ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: seedColor,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    
  );
}
