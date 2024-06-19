// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:fss_googlefonts/src/themes/primary_text_theme.dart';
import 'package:fss_googlefonts/src/themes/text_theme_light.dart';

ThemeData lightTheme(ColorScheme customColorScheme) {
  return ThemeData(
      brightness: Brightness.light,
      colorScheme: customColorScheme,
      // fix per FSS notes as of flutter sdk 3.22
      dividerColor: customColorScheme.outlineVariant,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: true,
      // rest of component themes go below here
      textTheme: textThemeLight(),
      primaryTextTheme: primaryTextTheme(customColorScheme),

  );
}
