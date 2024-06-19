// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:universal_platform/universal_platform.dart';

/// An example of how to do themed platform adaptations in which you do not
/// have to wait for the flutter SDK team to get them via the ThemeData
/// adaptations boilerplate support. With the use of the UniveralPlatform
/// package and some creative parameters I can deliver a different
/// themed appbar to android and ios and thus preserve user
/// expectations for both platforms.
///
///  Keep in mind when reading the MD3 spec in that they list the
///  three SliverAppbar sizes in the spec. Generally for the non-sliver
///  appbar you want the largest one.
///
/// @author Fredrick Allan Grott
AppBarTheme customLightAppBarTheme(BuildContext context, ColorScheme colorScheme) {
  if (UniversalPlatform.isAndroid) {
    return AppBarTheme(
      centerTitle: false,
      backgroundColor: colorScheme.onInverseSurface,
      foregroundColor: colorScheme.primary,
      elevation: 0,
      scrolledUnderElevation: 3,
      shadowColor: Colors.transparent,
      surfaceTintColor: colorScheme.surfaceTint,
      // easier to set this way as we only need this for android
      // and android users expect the statusBar to be transparent
      // Why needed? in Android OS all apps draw the statusBar stuff
      // as opposed the OS drawing it as its in iOS.
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      shape: const RoundedRectangleBorder(),
      titleTextStyle: Theme.of(context).textTheme.headlineLarge,
      actionsIconTheme: const IconThemeData(size: 24, color: Colors.black),
      iconTheme: const IconThemeData(size: 24, color: Colors.black),
    );
  } else if (UniversalPlatform.isIOS) {
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 3,
      shadowColor: Colors.transparent,
      surfaceTintColor: colorScheme.surfaceTint,
      shape: const RoundedRectangleBorder(),
      titleTextStyle: Theme.of(context).textTheme.headlineLarge,
      actionsIconTheme: const IconThemeData(size: 24, color: Colors.black),
      iconTheme: const IconThemeData(size: 24, color: Colors.black),
    );
  }

  return AppBarTheme(
    centerTitle: true,
    backgroundColor: colorScheme.primaryContainer,
    foregroundColor: colorScheme.primary,
    elevation: 0,
    scrolledUnderElevation: 3,
    shadowColor: Colors.transparent,
    surfaceTintColor: colorScheme.surfaceTint,
    shape: const RoundedRectangleBorder(),
    titleTextStyle: Theme.of(context).textTheme.headlineLarge,
    actionsIconTheme: const IconThemeData(size: 24, color: Colors.black),
    iconTheme: const IconThemeData(size: 24, color: Colors.black),
  );
}

AppBarTheme customDarkAppBarTheme(BuildContext context, ColorScheme colorScheme) {
  if (UniversalPlatform.isAndroid) {
    return AppBarTheme(
      centerTitle: false,
      backgroundColor: colorScheme.onInverseSurface,
      foregroundColor: colorScheme.primary,
      elevation: 0,
      scrolledUnderElevation: 3,
      shadowColor: Colors.transparent,
      surfaceTintColor: colorScheme.surfaceTint,
      // easier to set this way as we only need this for android
      // and android users expect the statusBar to be transparent
      // Why needed? in Android OS all apps draw the statusBar stuff
      // as opposed the OS drawing it as its in iOS.
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      shape: const RoundedRectangleBorder(),
      titleTextStyle: Theme.of(context).textTheme.headlineLarge,
      actionsIconTheme: const IconThemeData(size: 24, color: Colors.white),
      iconTheme: const IconThemeData(size: 24, color: Colors.white),
    );
  } else if (UniversalPlatform.isIOS) {
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 3,
      shadowColor: Colors.transparent,
      surfaceTintColor: colorScheme.surfaceTint,
      shape: const RoundedRectangleBorder(),
      titleTextStyle: Theme.of(context).textTheme.headlineLarge,
      actionsIconTheme: const IconThemeData(size: 24, color: Colors.white),
      iconTheme: const IconThemeData(size: 24, color: Colors.white),
    );
  }

  return AppBarTheme(
    centerTitle: true,
    backgroundColor: colorScheme.primaryContainer,
    foregroundColor: colorScheme.primary,
    elevation: 0,
    scrolledUnderElevation: 3,
    shadowColor: Colors.transparent,
    surfaceTintColor: colorScheme.surfaceTint,
    shape: const RoundedRectangleBorder(),
    titleTextStyle: Theme.of(context).textTheme.headlineLarge,
    actionsIconTheme: const IconThemeData(size: 24, color: Colors.white),
    iconTheme: const IconThemeData(size: 24, color: Colors.white),
  );
}
