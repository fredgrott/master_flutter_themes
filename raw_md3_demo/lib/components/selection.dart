// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team












import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/checkboxes.dart';
import 'package:raw_md3_demo/components/chips.dart';
import 'package:raw_md3_demo/components/component_group_decoration.dart';
import 'package:raw_md3_demo/components/date_picker.dart';
import 'package:raw_md3_demo/components/menus.dart';
import 'package:raw_md3_demo/components/radios.dart';
import 'package:raw_md3_demo/components/sliders.dart';
import 'package:raw_md3_demo/components/switches.dart';
import 'package:raw_md3_demo/components/time_picker.dart';

class Selection extends StatelessWidget {
  const Selection({super.key});

  @override
  Widget build(BuildContext context) {
    return const ComponentGroupDecoration(label: 'Selection', children: [
      Checkboxes(),
      Chips(),
      DatePicker(),
      TimePicker(),
      Menus(),
      Radios(),
      Sliders(),
      Switches(),
    ],);
  }
}
