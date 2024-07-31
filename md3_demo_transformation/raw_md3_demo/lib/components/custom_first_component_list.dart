// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team







import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:raw_md3_demo/build_animated_item.dart';
import 'package:raw_md3_demo/components/actions.dart';
import 'package:raw_md3_demo/components/communication.dart';
import 'package:raw_md3_demo/components/containment.dart';
import 'package:raw_md3_demo/components/navigation.dart';
import 'package:raw_md3_demo/components/selection.dart';
import 'package:raw_md3_demo/components/text_inputs.dart';
import 'package:raw_md3_demo/constants.dart';

class CustomFirstComponentList extends StatelessWidget {
  const CustomFirstComponentList({
    super.key,
    required this.showNavBottomBar,
    required this.scaffoldKey,
    required this.showSecondList,
  });

  final bool showNavBottomBar;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool showSecondList;

  @override
  Widget build(BuildContext context) {
    final firstScrollController = ScrollController();

    final List<Widget> children = [
      const CustomActions(),
      colDivider,
      const Communication(),
      colDivider,
      const Containment(),
      if (!showSecondList) ...[
        colDivider,
        Navigation(scaffoldKey: scaffoldKey),
        colDivider,
        const Selection(),
        colDivider,
        const TextInputs(),
      ],
    ];
   // final List<double?> heights = List.filled(children.length, null);

    

    return FocusTraversalGroup(
      child: CustomScrollView(
        controller: firstScrollController,
        key: const PageStorageKey("firstComponent"),
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: showSecondList ? const EdgeInsetsDirectional.only(end: smallSpacing) : EdgeInsets.zero,
            sliver: LiveSliverList(
              controller: firstScrollController,
              // ignore: avoid_redundant_argument_values
              showItemInterval: const Duration(milliseconds: 250),
              showItemDuration: const Duration(milliseconds: 300),
              itemCount: children.length,
              itemBuilder: animationItemBuilder(
                  (index) => children[index],
                  padding: const EdgeInsets.symmetric(vertical: 8),),
              ),
            ),
        ],
          ),
        
      
    );
  }
}
