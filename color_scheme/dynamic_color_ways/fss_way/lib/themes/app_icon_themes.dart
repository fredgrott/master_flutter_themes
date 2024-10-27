// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:fss_way/themes/build_context_extensions.dart';


/// Instead of Icons call Symbols.name
/// variations are:
///     -Outline
///     - Rounded
///     - Sharp
IconThemeData appIconThemeData(BuildContext context) {
  return IconThemeData(
    color: context.onSurface,
    fill: 0,
    weight: 400,
    grade: 0.25,
    opticalSize: 48,
  );
}

IconThemeData appPrimaryIconThemeData(BuildContext context) {
  return IconThemeData(
    color: context.primary,
    fill: 0,
    weight: 400,
    grade: 0.25,
    opticalSize: 48,
  );
}
