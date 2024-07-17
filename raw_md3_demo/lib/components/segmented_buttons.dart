// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';
import 'package:raw_md3_demo/components/multiple_choice.dart';
import 'package:raw_md3_demo/components/single_choice.dart';
import 'package:raw_md3_demo/constants.dart';

class SegmentedButtons extends StatelessWidget {
  const SegmentedButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentDecoration(
      label: 'Segmented buttons',
      tooltipMessage: 'Use SegmentedButton<T>',
      child: Column(
        children: <Widget>[
          SingleChoice(),
          colDivider,
          MultipleChoice(),
        ],
      ),
    );
  }
}
