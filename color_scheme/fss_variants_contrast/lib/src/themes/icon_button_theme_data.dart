// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:fss_variants_contrast/src/themes/scheme_color.dart';

IconButtonThemeData iconButtonThemeData({
  /// Typically the same `ColorScheme` that is also used for your `ThemeData`.
  required ColorScheme colorScheme,

  /// Defines if the theme uses tinted interaction effects.
  ///
  /// If undefined, defaults to false.
  bool? useTintedInteraction,

  /// Defines if the theme uses tinted disabled color.
  ///
  /// If undefined, defaults to false.
  bool? useTintedDisable,
}) {
  final bool tintInteract = useTintedInteraction ?? false;
  final bool tintDisable = useTintedDisable ?? false;

  // Due to issue:
  // https://github.com/flutter/flutter/pull/121884#issuecomment-1458505977
  // Only supports default colors for now, the colors below are only used
  // for default color matching tinted ink effects.

  // Get right foreground on color for background, defaults to primary.
  final Color foreground = schemeColor(SchemeColor.primary, colorScheme);
  // Get background color, defaults to onPrimary.
  final Color background = schemeColorPair(SchemeColor.primary, colorScheme);

  // Using these tinted overlay variable in all themes for ease of
  // reasoning and duplication.
  final Color overlay = background;
  final Color tint = foreground;
  final double factor = tintAlphaFactor(tint, colorScheme.brightness, false);

  // TODO(rydmike): Conditional tintInteract and tintDisabled due to issue.
    // See https://github.com/flutter/flutter/issues/123829
    return tintInteract || tintDisable
        ? IconButtonThemeData(
            style: ButtonStyle(
            // TODO(rydmike): Add tinted disable support when doable in SDK.
            // Due to above mentioned issue backgroundColor cannot be added yet
            // without destroying the different styles.
            // backgroundColor:
            //  WidgetStateProperty.resolveWith((Set<WidgetState> states) {
            //   if (states.contains(WidgetState.disabled)) {
            //     if (tintDisable) {
            //       return tintedDisable(colorScheme.onSurface, tint)
            //           .withAlpha(kAlphaVeryLowDisabled);
            //     }
            //     if (states.contains(WidgetState.selected)) {
            //       return colorScheme.onSurface.withOpacity(0.12);
            //     }
            //     return Colors.transparent;
            //   }
            //   if (states.contains(WidgetState.selected)) {
            //     return colorScheme.inverseSurface;
            //   }
            //   return Colors.transparent;
            // }),
            foregroundColor:
                WidgetStateProperty.resolveWith((Set<WidgetState> states) {
              // We can do a tinted foreground color when requested, since it
              // is the same for all variants by default as well.
              if (states.contains(WidgetState.disabled)) {
                if (tintDisable) {
                  return tintedDisable(colorScheme.onSurface, tint);
                }
                // return colorScheme.onSurface.withOpacity(0.38);
              }
              // if (states.contains(WidgetState.selected)) {
              //   return colorScheme.onInverseSurface;
              // }
              // return colorScheme.onSurfaceVariant;
              return null; // Gets us default for foregroundColor
            }),
            overlayColor: tintInteract
                ? WidgetStateProperty.resolveWith<Color>(
                    (Set<WidgetState> states) {
                    if (states.contains(WidgetState.selected)) {
                      if (states.contains(WidgetState.pressed)) {
                        if (tintInteract) {
                          return tintedPressed(overlay, tint, factor);
                        }
                        // TODO(rydmike): Add option when Flutter issue fixed.
                        // return
                        // colorScheme.onSurface.withAlpha(kAlphaPressed);
                      }
                      if (states.contains(WidgetState.hovered)) {
                        if (tintInteract) {
                          return tintedHovered(overlay, tint, factor);
                        }
                        // TODO(rydmike): Add option when Flutter issue fixed.
                        // return foreground.withAlpha(kAlphaHovered);
                      }
                      if (states.contains(WidgetState.focused)) {
                        if (tintInteract) {
                          return tintedFocused(overlay, tint, factor);
                        }
                        // TODO(rydmike): Add option when Flutter issue fixed.
                        // return foreground.withAlpha(kAlphaFocused);
                      }
                      return Colors.transparent;
                    }
                    if (states.contains(WidgetState.pressed)) {
                      if (tintInteract) {
                        return tintedPressed(overlay, tint, factor);
                      }
                      // TODO(rydmike): Add option when Flutter issue fixed.
                      // return foreground.withAlpha(kAlphaPressed);
                    }
                    if (states.contains(WidgetState.hovered)) {
                      if (tintInteract) {
                        return tintedHovered(overlay, tint, factor);
                      }
                      // TODO(rydmike): Add option when Flutter issue fixed.
                      // return colorScheme.onSurface.withAlpha(kAlphaHovered);
                    }
                    if (states.contains(WidgetState.focused)) {
                      if (tintInteract) {
                        return tintedFocused(overlay, tint, factor);
                      }
                      // TODO(rydmike): Add option when Flutter issue fixed.
                      // return colorScheme.onSurface.withAlpha(kAlphaFocused);
                    }
                    return Colors.transparent;
                  })
                : null, // Gets us default for overlayColor.
          ),)
        : const IconButtonThemeData();
}
