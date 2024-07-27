// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team


//TDOD: animate selectedicon with flutter animate package

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';


List<Widget> barWithBadgeDestinations = [
  NavigationDestination(
    tooltip: 'Mail',
    // Icons.mail-outlined
    icon: Badge.count(count: 1000, child: const Icon(Symbols.mail_outline)),
    label: 'Mail',
    selectedIcon: Badge.count(count: 1000, child: const Icon(Symbols.mail)),
  ),
  const NavigationDestination(
    tooltip: 'Chat',
    // Icons.chat_bubble_outline
    icon: Badge(label: Text('10'), child: Icon(Symbols.chat_bubble_outline)),
    label: 'Chat',
    selectedIcon: Badge(label: Text('10'), child: Icon(Symbols.chat_bubble)),
  ),
  const NavigationDestination(
    tooltip: 'Rooms',
    icon: Badge(child: Icon(Symbols.group_sharp)),
    label: 'Rooms',
    selectedIcon: Badge(child: Icon(Symbols.group_rounded)),
  ),
  NavigationDestination(
    tooltip: 'Meet',
    icon: Badge.count(count: 3, child: const Icon(Symbols.video_call_sharp)),
    label: 'Meet',
    selectedIcon: Badge.count(count: 3, child: const Icon(Symbols.video_call_rounded)),
  ),
];
