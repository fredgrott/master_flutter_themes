// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

BadgeThemeData lightBadgeThemeData(ColorScheme colorScheme) => BadgeThemeData(
  backgroundColor: colorScheme.surface,
  textColor: colorScheme.inversePrimary,
  smallSize: 9,
  largeSize: 14,
);
