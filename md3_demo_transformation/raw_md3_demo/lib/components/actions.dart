// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/buttons.dart';
import 'package:raw_md3_demo/components/component_group_decoration.dart';
import 'package:raw_md3_demo/components/floating_action_buttons.dart';
import 'package:raw_md3_demo/components/icon_toggle_bars.dart';
import 'package:raw_md3_demo/components/segmented_buttons.dart';

class CustomActions extends StatelessWidget {
  const CustomActions({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentGroupDecoration(label: 'Actions', children: <Widget>[
      Buttons(),
      FloatingActionButtons(),
      IconToggleButtons(),
      SegmentedButtons(),
    ],);
  }
}
