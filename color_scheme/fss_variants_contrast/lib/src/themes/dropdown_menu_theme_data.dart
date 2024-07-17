// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Mike Rydstrom's Flex Color Scheme
// under BSD 3-clauselicnese Copyright 2023

import 'package:flutter/material.dart';



/// An opinionated [DropdownMenuThemeData] theme.
DropdownMenuThemeData dropdownMenuThemeData({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
    required ColorScheme colorScheme,

    /// The [TextStyle] of the text entry in a [DropDownMenu].
    ///
    /// If not defined, defaults to Flutter SDK default via widget default
    /// [TextTheme.labelLarge].
    TextStyle? textStyle,

    /// An [InputDecorationTheme] for the text input part of the [DropDownMenu].
    /// Typically you want it to match the input decorator on your TextField.
    InputDecorationTheme? inputDecorationTheme,

    /// Overrides the default value for DropdownMenuThemeData
    /// [menuStyle.surfaceTintColor].
    Color? surfaceTintColor,
}) {
  return DropdownMenuThemeData(
    inputDecorationTheme: inputDecorationTheme,
      textStyle: textStyle,
      menuStyle: MenuStyle(
        surfaceTintColor: surfaceTintColor == null
            ? null
            : WidgetStatePropertyAll<Color>(surfaceTintColor),
      ),
  );
}
