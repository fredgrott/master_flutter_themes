// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:raw_md3_demo/build_animated_item.dart';

class CustomElevationScreen extends StatelessWidget {
  const CustomElevationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final elevationScrollController = ScrollController();

    final Color shadowColor = Theme.of(context).colorScheme.shadow;
    final Color surfaceTint = Theme.of(context).colorScheme.primary;

    final List<Widget> myEl = [
      SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 20, 16.0, 0),
              child: Text(
                'Surface Tint Color Only',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          ElevationGrid(
            surfaceTintColor: surfaceTint,
            shadowColor: Colors.transparent,
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                child: Text(
                  'Surface Tint Color and Shadow Color',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ]),
          ),
          ElevationGrid(
            shadowColor: shadowColor,
            surfaceTintColor: surfaceTint,
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 0),
                child: Text(
                  'Shadow Color Only',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ]),
          ),
          ElevationGrid(shadowColor: shadowColor),

    ];

    return Expanded(
       child: CustomScrollView(
       key: const PageStorageKey("elevation"),
        // ignore: avoid_redundant_argument_values
        controller: elevationScrollController,
        slivers: <Widget>[
           SliverPadding(
             padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
             sliver: LiveSliverList(
               controller: elevationScrollController,
               // ignore: avoid_redundant_argument_values
               showItemInterval: const Duration(milliseconds: 250),
               showItemDuration: const Duration(milliseconds: 300),
               itemCount: myEl.length,
               itemBuilder: animationItemBuilder(
                  (index) => myEl[index],
               ),
             ),
           ),
        ],
       ),
    );



  }

}

const double narrowScreenWidthThreshold = 450;

class ElevationGrid extends StatelessWidget {
  const ElevationGrid({super.key, this.shadowColor, this.surfaceTintColor});

  final Color? shadowColor;
  final Color? surfaceTintColor;

  List<ElevationCard> elevationCards(
    Color? shadowColor,
    Color? surfaceTintColor,
  ) {
    return elevations
        .map(
          (elevationInfo) => ElevationCard(
            info: elevationInfo,
            shadowColor: shadowColor,
            surfaceTint: surfaceTintColor,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(8),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {
          if (constraints.crossAxisExtent < narrowScreenWidthThreshold) {
            return SliverGrid.count(
              crossAxisCount: 3,
              children: elevationCards(shadowColor, surfaceTintColor),
            );
          } else {
            return SliverGrid.count(
              crossAxisCount: 6,
              children: elevationCards(shadowColor, surfaceTintColor),
            );
          }
        },
      ),
    );
  }
}

class ElevationCard extends StatefulWidget {
  const ElevationCard({
    super.key,
    required this.info,
    this.shadowColor,
    this.surfaceTint,
  });

  final ElevationInfo info;
  final Color? shadowColor;
  final Color? surfaceTint;

  @override
  State<ElevationCard> createState() => _ElevationCardState();
}

class _ElevationCardState extends State<ElevationCard> {
  late double _elevation;

  @override
  void initState() {
    super.initState();
    _elevation = widget.info.elevation;
  }

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.all(Radius.circular(4.0));
    final Color color = Theme.of(context).colorScheme.surface;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: borderRadius,
        elevation: _elevation,
        color: color,
        shadowColor: widget.shadowColor,
        surfaceTintColor: widget.surfaceTint,
        type: MaterialType.card,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Level ${widget.info.level}',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                '${widget.info.elevation.toInt()} dp',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              if (widget.surfaceTint != null)
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      '${widget.info.overlayPercent}%',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class ElevationInfo {
  const ElevationInfo(this.level, this.elevation, this.overlayPercent);
  final int level;
  final double elevation;
  final int overlayPercent;
}

const List<ElevationInfo> elevations = <ElevationInfo>[
  ElevationInfo(0, 0.0, 0),
  ElevationInfo(1, 1.0, 5),
  ElevationInfo(2, 3.0, 8),
  ElevationInfo(3, 6.0, 11),
  ElevationInfo(4, 8.0, 12),
  ElevationInfo(5, 12.0, 14),
];
