// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team




import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:raw_md3_demo/build_animated_item.dart';
import 'package:raw_md3_demo/components/navigation.dart';
import 'package:raw_md3_demo/components/selection.dart';
import 'package:raw_md3_demo/components/text_inputs.dart';
import 'package:raw_md3_demo/constants.dart';

class CustomSecondComponentList extends StatelessWidget {
  const CustomSecondComponentList({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    final secondScrollController = ScrollController();

    final List<Widget> children = [
      Navigation(scaffoldKey: scaffoldKey),
      colDivider,
      const Selection(),
      colDivider,
      const TextInputs(),
    ];
    //final List<double?> heights = List.filled(children.length, null);

    

    
    // Fully traverse this list before moving on.
    return FocusTraversalGroup(
      child: CustomScrollView(
        restorationId: "secondme",
        // ignore: avoid_redundant_argument_values
        controller: secondScrollController,
        physics: const BouncingScrollPhysics(),
        key: const PageStorageKey("secondComponent"),
        slivers: [
          SliverPadding(
            padding: const EdgeInsetsDirectional.only(end: smallSpacing),
            sliver: LiveSliverList(
              controller: secondScrollController,
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
