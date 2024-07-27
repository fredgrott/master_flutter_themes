// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team

import 'package:flutter/material.dart';

import 'package:raw_md3_demo/components/actions.dart';
import 'package:raw_md3_demo/components/build_slivers.dart';
import 'package:raw_md3_demo/components/cache_height.dart';
import 'package:raw_md3_demo/components/communication.dart';
import 'package:raw_md3_demo/components/containment.dart';
import 'package:raw_md3_demo/components/navigation.dart';
import 'package:raw_md3_demo/components/selection.dart';
import 'package:raw_md3_demo/components/text_inputs.dart';
import 'package:raw_md3_demo/constants.dart';

// Modified as one really should use page storage to remember scroll positions

class FirstComponentList extends StatelessWidget {
  const FirstComponentList({
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
    final List<double?> heights = List.filled(children.length, null);

    

    return FocusTraversalGroup(
      child: CustomScrollView(
        controller: firstScrollController,
        key: const PageStorageKey("firstComponent"),
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: showSecondList ? const EdgeInsetsDirectional.only(end: smallSpacing) : EdgeInsets.zero,
            sliver: SliverList(
              // to make it easy we use extensions to
              // assist in building the animation before
              // its converted to a sliver and thus are still
              // on the RenderBox API as far as layout
              // protocols.
              //
              // When using build delegates in slivers or lists
              // one does not use the AnimatedList class from the
              // flutter_animate package. Instead we just do the
              // animate chain.
              delegate: BuildSlivers(
                heights: heights,
                builder: (context, index) {
                  return CacheHeight(
                    heights: heights,
                    index: index,
                    // children[index]
                    // it needs to be here as we are using the Extension method of  animate to get
                    // the scroll adapter stuff and instead of using the effects List just chain
                    // to the animate
                    child: children[index],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
