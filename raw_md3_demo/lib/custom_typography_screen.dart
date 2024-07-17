// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team

import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:raw_md3_demo/build_animated_item.dart';

/// Basically create list of Type widgets
/// want to display in list view and iterate
/// over the list in an AnimateIfVisible class
/// to trigger the animation sequence triggered
/// by scroll.
class CustomTypographyScreen extends StatelessWidget {
  const CustomTypographyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final typeScrollController = ScrollController();

    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);

    final List<Widget> myType = [
      const SizedBox(height: 7),
      TextStyleExample(
        name: 'Display Large',
        style: textTheme.displayLarge!,
      ),
      TextStyleExample(
        name: 'Display Medium',
        style: textTheme.displayMedium!,
      ),
      TextStyleExample(
        name: 'Display Small',
        style: textTheme.displaySmall!,
      ),
      TextStyleExample(
        name: 'Headline Large',
        style: textTheme.headlineLarge!,
      ),
      TextStyleExample(
        name: 'Headline Medium',
        style: textTheme.headlineMedium!,
      ),
      TextStyleExample(
        name: 'Headline Small',
        style: textTheme.headlineSmall!,
      ),
      TextStyleExample(name: 'Title Large', style: textTheme.titleLarge!),
      TextStyleExample(name: 'Title Medium', style: textTheme.titleMedium!),
      TextStyleExample(name: 'Title Small', style: textTheme.titleSmall!),
      TextStyleExample(name: 'Label Large', style: textTheme.labelLarge!),
      TextStyleExample(name: 'Label Medium', style: textTheme.labelMedium!),
      TextStyleExample(name: 'Label Small', style: textTheme.labelSmall!),
      TextStyleExample(name: 'Body Large', style: textTheme.bodyLarge!),
      TextStyleExample(name: 'Body Medium', style: textTheme.bodyMedium!),
      TextStyleExample(name: 'Body Small', style: textTheme.bodySmall!),
    ];

    return Expanded(
        
        child: LiveList(
          key: const PageStorageKey("type"),
          controller: typeScrollController,
          // ignore: avoid_redundant_argument_values
          showItemInterval: const Duration(milliseconds: 150),
          showItemDuration: const Duration(milliseconds: 350),
          padding: const EdgeInsets.all(1),
          reAnimateOnVisibility: true,
          // ignore: avoid_redundant_argument_values
          scrollDirection: Axis.vertical,
          itemCount: myType.length,
          itemBuilder: animationItemBuilder(
            (index) => myType[index],
          ),
        ),);
  }
}

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({
    super.key,
    required this.name,
    required this.style,
  });

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name, style: style),
    );
  }
}
