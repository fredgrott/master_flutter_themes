// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// This is how I am approaching Component Themes.
///  I review the _M3Defaults class for every component theme and 
///  what is marked as a super I choose what designers will still want 
///  to change and include that with other stuff as nullable 
///  parameters.
/// 
///  For example with _AppBarDefaultsM3 class these are in the super:
///       elevation: 0.0,
///       scrolledUnderElevation: 3.0,
///        titleSpacing: NavigationToolbar.kMiddleSpacing,
///        toolbarHeight: 64.0,
/// 
///  Other MD3 defaults are:
///         backgroundColor   surface
///        foregroundColor onSurface
///        shadowColor Colors.transparent
///         surfaceTintColor Colors.transparent
/// 
///     iconTheme
///           color onSurface
///            size 24.0
///     actionsIconTheme
///            color onSurfaceVariant
///            size 24.0
///     toolbarTextStyle bodyMedium
///     titleTextStyle titleLarge
/// 
///    Note: As of July 2024 surfaceTintColor is still in the SDK even though we are 
///               transitioning to not use it. So make sure to set to Colors.transparent to avoid
///               messing with setting foreground color.
/// 
///  @author Fredrick Allan Grott
AppBarTheme appBarTheme({
  /// Typically the same [ColorScheme] that is also used for your [ThemeData].
  ColorScheme? colorScheme,

  /// Whether the AppBar title should be centered.
  ///
  /// Overrides the default value of [AppBar.centerTitle] property in all
  /// descendant [AppBar] widgets. If this property is null, then value
  /// is adapted to the current [TargetPlatform].
  bool? centerTitle,

  /// Overrides the default value of [AppBar.backgroundColor] in all
  /// descendant [AppBar] widgets.
  ///
  /// See also:
  ///
  ///  * [foregroundColor], which overrides the default value of
  ///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
  Color? backgroundColor,

  /// Overrides the default value of [AppBar.foregroundColor] in all
  /// descendant [AppBar] widgets. It forms the color of the [IconTheme]
  /// amd [ActionsTheme] of the [AppBar].
  ///
  /// See also:
  ///
  ///  * [backgroundColor], which overrides the default value of
  ///    [AppBar.backgroundColor] in all descendant [AppBar] widgets.
  Color? foregroundColor,

  /// Overrides the default value of [AppBar.elevation] in all
  /// descendant [AppBar] widgets.
  double? elevation,

  /// Overrides the default value of [AppBar.scrolledUnderElevation] in all
  /// descendant [AppBar] widgets.
  ///
  /// If not defined, defaults to 3.
  double? scrolledUnderElevation,

  /// Overrides the default value of [AppBar.iconTheme] in all
  /// descendant [AppBar] widgets.
  ///
  /// See also:
  ///
  ///  * [actionsIconTheme], which overrides the default value of
  ///    [AppBar.actionsIconTheme] in all descendant [AppBar] widgets.
  ///  * [foregroundColor], which overrides the default value
  ///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
  IconThemeData? iconTheme,

  /// Overrides the default value of [AppBar.actionsIconTheme] in all
  /// descendant [AppBar] widgets.
  ///
  /// See also:
  ///
  ///  * [iconTheme], which overrides the default value of
  ///    [AppBar.iconTheme] in all descendant [AppBar] widgets.
  ///  * [foregroundColor], which overrides the default value
  ///    [AppBar.foregroundColor] in all descendant [AppBar] widgets.
  IconThemeData? actionsIconTheme,

  /// Overrides the default value of [AppBar.shadowColor] in all
  /// descendant [AppBar] widgets.
  Color? shadowColor,

  /// Overrides the default value of [AppBar.surfaceTintColor] in all
  /// descendant [AppBar] widgets.
  Color? surfaceTintColor,

  /// Overrides the default value of [AppBar.systemOverlayStyle]
  /// property in all descendant [AppBar] widgets.
  SystemUiOverlayStyle? systemOverlayStyle,

  TextStyle? toolbarTextStyle,

  TextStyle? titleTextStyle,
}){
  return AppBarTheme(
    centerTitle: centerTitle,
    backgroundColor: backgroundColor,
    foregroundColor: foregroundColor,
    elevation: elevation,
    scrolledUnderElevation: scrolledUnderElevation,
    iconTheme: iconTheme,
    actionsIconTheme: actionsIconTheme,
    systemOverlayStyle: systemOverlayStyle,
    shadowColor: shadowColor,
    surfaceTintColor: surfaceTintColor,
    // TODO(rydmike): This is a workaround to make tint elevation animate.
    // See issue https://github.com/flutter/flutter/issues/131042.
    shape: const RoundedRectangleBorder(),
    toolbarTextStyle: toolbarTextStyle,
    titleTextStyle: titleTextStyle,
  );
}
