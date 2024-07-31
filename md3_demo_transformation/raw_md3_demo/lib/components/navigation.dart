// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team





import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/bottom_app_bars.dart';
import 'package:raw_md3_demo/components/component_group_decoration.dart';
import 'package:raw_md3_demo/components/navigation_bars.dart';
import 'package:raw_md3_demo/components/navigation_drawers.dart';
import 'package:raw_md3_demo/components/navigation_rails.dart';
import 'package:raw_md3_demo/components/search_anchors.dart';
import 'package:raw_md3_demo/components/tabs.dart';
import 'package:raw_md3_demo/components/top_app_bars.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return ComponentGroupDecoration(label: 'Navigation', children: [
      const BottomAppBars(),
      const NavigationBars(
        selectedIndex: 0,
        isExampleBar: true,
      ),
      NavigationDrawers(scaffoldKey: scaffoldKey),
      const NavigationRails(),
      const Tabs(),
      const SearchAnchors(),
      const TopAppBars(),
    ],);
  }
}
