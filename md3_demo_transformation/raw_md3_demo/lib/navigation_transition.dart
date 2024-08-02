// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team

import 'package:flutter/material.dart';
import 'package:raw_md3_demo/bar_transition.dart';
import 'package:raw_md3_demo/components/navigation_drawer_section.dart';
import 'package:raw_md3_demo/md3_utils/sized_context.dart';


import 'package:raw_md3_demo/rail_transition.dart';

class NavigationTransition extends StatefulWidget {
  const NavigationTransition({
    super.key,
    required this.scaffoldKey,
    required this.animationController,
    required this.railAnimation,
    required this.navigationRail,
    required this.navigationBar,
    required this.appBar,
    required this.body,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;
  final AnimationController animationController;
  final CurvedAnimation railAnimation;
  final Widget navigationRail;
  final Widget navigationBar;
  final PreferredSizeWidget appBar;
  final Widget body;

  @override
  State<NavigationTransition> createState() => _NavigationTransitionState();
}

class _NavigationTransitionState extends State<NavigationTransition> {
  late final AnimationController controller;
  late final CurvedAnimation railAnimation;
  late final ReverseAnimation barAnimation;
  bool controllerInitialized = false;
  bool showDivider = false;

  final pageBucket = PageStorageBucket();

  @override
  void initState() {
    super.initState();

    controller = widget.animationController;
    railAnimation = widget.railAnimation;

    barAnimation = ReverseAnimation(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.0, 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    
    // to adjust visual density via WindowSize
    return Theme(
      data: Theme.of(context).copyWith(visualDensity: VisualDensity(horizontal:context.appWindowSize.visualHorz, vertical:context.appWindowSize.visualVert)),
      child: Scaffold(
        key: widget.key,
        appBar: widget.appBar,
        // to get scroll position remembered
        body: PageStorage(
          bucket: pageBucket,
          child: Row(
            children: <Widget>[
              RailTransition(
                animation: railAnimation,
                backgroundColor: colorScheme.surface,
                child: widget.navigationRail,
              ),
              widget.body,
            ],
          ),
        ),

        bottomNavigationBar: BarTransition(
          animation: barAnimation,
          backgroundColor: colorScheme.surface,
          child: widget.navigationBar,
        ),
        endDrawer: const NavigationDrawerSection(),
     ),
    );

    
  }
}
