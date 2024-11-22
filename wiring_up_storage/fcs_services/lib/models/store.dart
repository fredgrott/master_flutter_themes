// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

sealed class Store {
  static const String keyThemeMode = 'themeMode';

  static const ThemeMode defaultThemeMode = ThemeMode.system;
}
