// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team




// If the content of a CustomScrollView does not change, then it's
// safe to cache the heights of each item as they are laid out. The
// sum of the cached heights are returned by an override of
// `SliverChildDelegate.estimateMaxScrollOffset`. The default version
// of this method bases its estimate on the average height of the
// visible items. The override ensures that the scrollbar thumb's
// size, which depends on the max scroll offset, will shrink smoothly
// as the contents of the list are exposed for the first time, and
// then remain fixed.
import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/render_cache_height.dart';

class CacheHeight extends SingleChildRenderObjectWidget {
  const CacheHeight({
    super.child,
    required this.heights,
    required this.index,
  });

  final List<double?> heights;
  final int index;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return  RenderCacheHeight(
      heights: heights,
      index: index,
    );
  }

  @override
  void updateRenderObject(
      BuildContext context, RenderCacheHeight renderObject,) {
    renderObject
      ..heights = heights
      ..index = index;
  }
}
