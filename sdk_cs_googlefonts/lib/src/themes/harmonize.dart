// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';


// This is modified from the package dynamic color as I needed 
// it to fix color scheme for semantic error colors



/// Shifts color [from] towards color [to].
Color _harmonizeColor(Color from, Color to) {
  if (from == to) return from;
  return Color(Blend.harmonize(from.value, to.value));
}

extension ColorHarmonizationExt on Color {
  /// Harmonizes this color with [color].
  ///
  /// [color] will typically be a dynamic [ColorScheme.primary] color.
  Color harmonizeWith(Color color) => _harmonizeColor(this, color);
}

extension ColorSchemeHarmonizationExt on ColorScheme {
  /// Harmonizes [color] with this [ColorScheme]'s [primary].
  Color _harmonizeWithPrimary(Color color) => _harmonizeColor(color, primary);

  /// Harmonizes semantic and custom [ColorScheme] colors with its [primary] color.
  ///
  /// Harmonization makes adding and introducing new colors to your app more
  /// seamless by automatically shifting hue and chroma slightly so that a
  /// product's colors feel more cohesive with dynamic user colors.
  ///
  /// Semantic colors (i.e. colors with meaning) include colors such as [error].
  /// See https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization
  /// for more information.
  ///
  ColorScheme harmonizedSemantic() {
    return copyWith(
      error: _harmonizeWithPrimary(error),
      onError: _harmonizeWithPrimary(onError),
      errorContainer: _harmonizeWithPrimary(errorContainer),
      onErrorContainer: _harmonizeWithPrimary(onErrorContainer),
    );
  }
}