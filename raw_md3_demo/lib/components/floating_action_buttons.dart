// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team




import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';
import 'package:raw_md3_demo/constants.dart';

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Floating action buttons',
      tooltipMessage:
          'Use FloatingActionButton or FloatingActionButton.extended',
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: smallSpacing,
        spacing: smallSpacing,
        children: [
          FloatingActionButton.small(
            onPressed: () {},
            tooltip: 'Small',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.extended(
            onPressed: () {},
            tooltip: 'Extended',
            icon: const Icon(Icons.add),
            label: const Text('Create'),
          ),
          FloatingActionButton(
            onPressed: () {},
            tooltip: 'Standard',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.large(
            onPressed: () {},
            tooltip: 'Large',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
