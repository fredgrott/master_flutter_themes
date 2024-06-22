// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

extension CustomMQExt on BuildContext {

  /// iOS is the only platform that has a system high contrast
  /// setting so we need to check for this in the new ThemeData
  /// ColorScheme contrastLevels logic
  bool get isIOSHighContrast => MediaQuery.of(this).highContrast;
}
