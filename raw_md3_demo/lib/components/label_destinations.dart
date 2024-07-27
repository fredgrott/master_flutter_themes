// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:raw_md3_demo/components/example_destination.dart';

const List<ExampleDestination> labelDestinations = <ExampleDestination>[
  ExampleDestination(
      'Family', Icon(Symbols.bookmark_border), Icon(Symbols.bookmark),),
  ExampleDestination(
      'School', Icon(Symbols.bookmark_border), Icon(Symbols.bookmark),),
  ExampleDestination('Work', Icon(Symbols.bookmark_border), Icon(Symbols.bookmark)),
];
