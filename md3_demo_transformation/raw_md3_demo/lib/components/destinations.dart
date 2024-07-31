// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'package:raw_md3_demo/components/example_destination.dart';

const List<ExampleDestination> destinations = <ExampleDestination>[
  ExampleDestination('Inbox', Icon(Symbols.inbox_sharp), Icon(Symbols.inbox)),
  ExampleDestination('Outbox', Icon(Symbols.send_sharp), Icon(Symbols.send)),
  ExampleDestination(
      'Favorites', Icon(Symbols.favorite_sharp), Icon(Symbols.favorite),),
  ExampleDestination('Trash', Icon(Symbols.delete_sharp), Icon(Symbols.delete)),
];
