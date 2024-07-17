// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:raw_md3_demo/components/build_slivers.dart';
import 'package:raw_md3_demo/components/cache_height.dart';
import 'package:raw_md3_demo/components/navigation.dart';
import 'package:raw_md3_demo/components/selection.dart';
import 'package:raw_md3_demo/components/text_inputs.dart';
import 'package:raw_md3_demo/constants.dart';

// added page storage so scroll position is saved when transversing
// screens.

class SecondComponentList extends StatelessWidget {
  const SecondComponentList({
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
    final List<double?> heights = List.filled(children.length, null);

    

    
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
            sliver: SliverList(
              delegate: BuildSlivers(
                heights: heights,
                builder: (context, index) {
                  return CacheHeight(
                    heights: heights,
                    index: index,
                    child: children[index].animate(
                      adapter: ScrollAdapter(
                        secondScrollController,
                        begin: 20,
                        end: -20,
                      ),
                    ).shimmer(
                        duration: 1200.ms,
                        color: Theme.of(context).colorScheme.secondary,
                    ),

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
