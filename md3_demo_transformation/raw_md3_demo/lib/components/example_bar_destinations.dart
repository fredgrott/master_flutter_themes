// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

const List<Widget> exampleBarDestinations = [
  NavigationDestination(
    tooltip: '',
    icon: Icon(Symbols.explore_sharp),
    label: 'Explore',
    selectedIcon: Icon(Symbols.explore),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Symbols.pets_sharp),
    label: 'Pets',
    selectedIcon: Icon(Symbols.pets),
  ),
  NavigationDestination(
    tooltip: '',
    icon: Icon(Symbols.account_box_sharp),
    label: 'Account',
    selectedIcon: Icon(Symbols.account_box),
  ),
];
