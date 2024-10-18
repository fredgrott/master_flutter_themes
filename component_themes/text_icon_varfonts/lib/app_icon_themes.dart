

import 'package:flutter/material.dart';
import 'package:text_icon_varfonts/build_context_extensions.dart';

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