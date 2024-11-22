// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// TextThemeExt provides textTheme getters on BuildContext
/// so that everything is a bit more less in writing.
///
/// @author Fredrick Allan Grott
extension TextThemeExt<T> on BuildContext {
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
}

extension ColorSchemeExt<T> on BuildContext {
  Color? get primary => Theme.of(this).colorScheme.primary;
  Color? get onPrimary => Theme.of(this).colorScheme.onPrimary;
  Color? get primaryContainer => Theme.of(this).colorScheme.primaryContainer;
  Color? get onPrimaryContainer => Theme.of(this).colorScheme.onPrimaryContainer;
  Color? get primaryFixed => Theme.of(this).colorScheme.primaryFixed;
  Color? get primaryFixedDim => Theme.of(this).colorScheme.primaryFixedDim;
  Color? get onPrimaryFixed => Theme.of(this).colorScheme.onPrimaryFixed;
  Color? get onPrimaryFixedVariant => Theme.of(this).colorScheme.onPrimaryFixedVariant;
  Color? get secondary => Theme.of(this).colorScheme.secondary;
  Color? get onSecondary => Theme.of(this).colorScheme.onSecondary;
  Color? get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;
  Color? get onSecondaryContainer => Theme.of(this).colorScheme.onSecondaryContainer;
  Color? get secondaryFixed => Theme.of(this).colorScheme.secondaryFixed;
  Color? get secondaryFixedDim => Theme.of(this).colorScheme.secondaryFixedDim;
  Color? get onSecondaryFixed => Theme.of(this).colorScheme.onSecondaryFixed;
  Color? get onSecondaryFixedVariant => Theme.of(this).colorScheme.onSecondaryFixedVariant;
  Color? get tertiary => Theme.of(this).colorScheme.tertiary;
  Color? get onTertiary => Theme.of(this).colorScheme.onTertiary;
  Color? get tertiaryContainer => Theme.of(this).colorScheme.tertiaryContainer;
  Color? get onTertiaryContainer => Theme.of(this).colorScheme.onTertiaryContainer;
  Color? get tertiaryFixed => Theme.of(this).colorScheme.tertiaryFixed;
  Color? get tertiaryFixedDim => Theme.of(this).colorScheme.tertiaryFixedDim;
  Color? get onTertiaryFixed => Theme.of(this).colorScheme.onTertiaryFixed;
  Color? get onTertiaryFixedVariant => Theme.of(this).colorScheme.onTertiaryFixedVariant;
  Color? get error => Theme.of(this).colorScheme.error;
  Color? get onError => Theme.of(this).colorScheme.onError;
  Color? get errorContainer => Theme.of(this).colorScheme.errorContainer;
  Color? get onErrorContainer => Theme.of(this).colorScheme.onErrorContainer;
  Color? get surface => Theme.of(this).colorScheme.surface;
  Color? get onSurface => Theme.of(this).colorScheme.onSurface;
  Color? get surfaceDim => Theme.of(this).colorScheme.surfaceDim;
  Color? get surfaceBright => Theme.of(this).colorScheme.surfaceBright;
  Color? get surfaceContainerLowest => Theme.of(this).colorScheme.surfaceContainerLowest;
  Color? get surfaceContainerLow => Theme.of(this).colorScheme.surfaceContainerLow;
  Color? get surfaceContainer => Theme.of(this).colorScheme.secondaryContainer;
  Color? get surfaceContainerHigh => Theme.of(this).colorScheme.surfaceContainerHigh;
  Color? get surfaceContainerHighest => Theme.of(this).colorScheme.surfaceContainerHighest;
  Color? get onSurfaceVariant => Theme.of(this).colorScheme.onSurfaceVariant;
  Color? get outline => Theme.of(this).colorScheme.outline;
  Color? get outlineVariant => Theme.of(this).colorScheme.outlineVariant;
  Color? get shadow => Theme.of(this).colorScheme.shadow;
  Color? get scrim => Theme.of(this).colorScheme.scrim;
  Color? get inverseSurface => Theme.of(this).colorScheme.inverseSurface;
  Color? get onInverseSurface => Theme.of(this).colorScheme.onInverseSurface;
  Color? get inversePrimary => Theme.of(this).colorScheme.inversePrimary;
  Color? get surfaceTint => Theme.of(this).colorScheme.surfaceTint;
}
