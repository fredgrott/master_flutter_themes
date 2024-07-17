// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:fss_variants_contrast/src/themes/scheme_color.dart';

MenuThemeData menuThemeData({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required ColorScheme colorScheme,

    /// Defines which [Theme] based [ColorScheme] based background color
    /// of [PopupMenuButton].
    ///
    /// If not defined, will remains null and via Flutter SDK defaults get
    /// [ColorScheme.surface] color.
    SchemeColor? backgroundSchemeColor,

    /// Menu background opacity.
    ///
    /// Used by FlexColorScheme to modify the opacity the themed [MenuBar],
    /// [MenuAnchor] and [DropDownMenu] background color.
    ///
    /// Defaults to undefined (null).
    /// If undefined, produced result is same as 1, fully opaque.
    ///
    /// If opacity is defined and [backgroundSchemeColor] is undefined,
    /// then [ColorScheme.surface] will be used as background color to
    /// make a background color with opacity.
    double? opacity,

    /// Menu corner radius.
    ///
    /// If not defined, default to 4 via Menu widget Flutter SDK defaults.
    double? radius,

    /// The padding between the menu's boundary and its child.
    EdgeInsetsGeometry? padding,

    /// Popup menu elevation.
    ///
    /// If not defined, defaults to 3 dp via Flutter widget SDK defaults.
    double? elevation,

    /// Overrides the default value for MenuThemeData
    /// [menuStyle.surfaceTintColor].
    Color? surfaceTintColor,
  }) {
  // Get effective background color.
  final Color? backgroundColor = backgroundSchemeColor != null
      ? schemeColor(backgroundSchemeColor, colorScheme).withOpacity(opacity ?? 1.0)
      : opacity != null
          ? colorScheme.surface.withOpacity(opacity)
          : null;

  final bool allDefaults = backgroundSchemeColor == null &&
      opacity == null &&
      radius == null &&
      padding == null &&
      elevation == null &&
      surfaceTintColor == null;

  return MenuThemeData(
    style: allDefaults
        ? null
        : MenuStyle(
            elevation: elevation == null ? null : WidgetStatePropertyAll<double?>(elevation),
            backgroundColor: backgroundSchemeColor == null && opacity == null
                ? null
                : WidgetStatePropertyAll<Color?>(backgroundColor),
            padding: padding == null ? null : WidgetStatePropertyAll<EdgeInsetsGeometry?>(padding),
            surfaceTintColor: surfaceTintColor == null ? null : WidgetStatePropertyAll<Color>(surfaceTintColor),
            shape: radius == null
                ? null
                : WidgetStatePropertyAll<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(radius),
                      ),
                    ),
                  ),
          ),
  );
}
