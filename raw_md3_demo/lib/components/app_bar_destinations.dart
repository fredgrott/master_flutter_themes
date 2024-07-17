// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

const List<NavigationDestination> appBarDestinations = [
  NavigationDestination(
    tooltip: '',
    icon: Icon(Symbols.widgets_rounded),
    label: 'Components',
    selectedIcon: Icon(Symbols.widgets),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Symbols.format_paint_rounded),
    label: 'Color',
    selectedIcon: Icon(Symbols.format_paint),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Symbols.text_snippet_rounded),
    label: 'Typography',
    selectedIcon: Icon(Symbols.text_snippet),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Symbols.invert_colors_rounded),
    label: 'Elevation',
    selectedIcon: Icon(Symbols.opacity),
  ),
];
