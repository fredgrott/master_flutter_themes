// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// Only difference between this a regular IconThemeData is that 
/// it has the onSurfaceVariant color.
/// 
/// @author Fredrick Allan Grott
IconThemeData actionsIconTheme(Color onSurfaceVariant) => IconThemeData(
  size: 24,
  fill: 0.0,
  weight: 400,
  grade: 0.0,
  opticalSize: 24.0,
  color: onSurfaceVariant,
  opacity: 1.0,
  applyTextScaling: false,
);
