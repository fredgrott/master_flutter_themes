// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team





import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/bottom_sheet_section.dart';
import 'package:raw_md3_demo/components/cards.dart';
import 'package:raw_md3_demo/components/component_group_decoration.dart';
import 'package:raw_md3_demo/components/dialogs.dart';
import 'package:raw_md3_demo/components/dividers.dart';
import 'package:raw_md3_demo/components/list_tiles.dart';
import 'package:raw_md3_demo/components/modal_side_sheet.dart';

class Containment extends StatelessWidget {
  const Containment({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentGroupDecoration(label: 'Containment', children: [
      const BottomSheetSection(),
      const Cards(),
      const Dialogs(),
      const  Dividers(),
      const ListTiles(),
      CustomModalSideSheet(),
      // TODO: Add Side sheets, https://github.com/flutter/flutter/issues/119328
    ],);
  }
}
