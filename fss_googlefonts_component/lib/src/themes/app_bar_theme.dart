// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

AppBarTheme lightAppBarTheme(ColorScheme colorScheme) => AppBarTheme(
  centerTitle: true,
   color:  colorScheme.primary,
   backgroundColor: colorScheme.inversePrimary,
   foregroundColor: colorScheme.primaryContainer,
   elevation: 0,
   scrolledUnderElevation: 3,
   shadowColor: colorScheme.shadow,
   surfaceTintColor: colorScheme.surfaceTint,
   shape: const RoundedRectangleBorder(),
   systemOverlayStyle: SystemUiOverlayStyle.light,
   iconTheme: const IconThemeData.fallback(),
   actionsIconTheme:  const IconThemeData.fallback(),

);


AppBarTheme darkAppBarTheme(ColorScheme colorScheme) => AppBarTheme(
  centerTitle: true,
   color:  colorScheme.primary,
   backgroundColor: colorScheme.inversePrimary,
   foregroundColor: colorScheme.primaryContainer,
   elevation: 0,
   scrolledUnderElevation: 3,
   shadowColor: colorScheme.shadow,
   surfaceTintColor: colorScheme.surfaceTint,
   shape: const RoundedRectangleBorder(),
   systemOverlayStyle: SystemUiOverlayStyle.dark,
   iconTheme:  const IconThemeData.fallback(),
   actionsIconTheme: const IconThemeData.fallback() ,

);
