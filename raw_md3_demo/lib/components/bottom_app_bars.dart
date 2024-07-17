// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team


import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';
import 'package:raw_md3_demo/components/icon_button_anchor_example.dart';

class BottomAppBars extends StatelessWidget {
  const BottomAppBars({super.key});

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Bottom app bar',
      tooltipMessage: 'Use BottomAppBar',
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {},
                elevation: 0.0,
                child: const Icon(Symbols.add),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.endContained,
              bottomNavigationBar: BottomAppBar(
                child: Row(
                  children: <Widget>[
                    const IconButtonAnchorExample(),
                    IconButton(
                      tooltip: 'Search',
                      icon: const Icon(Symbols.search),
                      onPressed: () {},
                    ),
                    IconButton(
                      tooltip: 'Favorite',
                      icon: const Icon(Symbols.favorite),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
