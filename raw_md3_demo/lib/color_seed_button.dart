// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'package:raw_md3_demo/constants.dart';

class ColorSeedButton extends StatelessWidget {
  const ColorSeedButton({
    required this.handleColorSelect,
    required this.colorSelected,
    required this.colorSelectionMethod,
  });

  final void Function(int) handleColorSelect;
  final ColorSeed colorSelected;
  final ColorSelectionMethod colorSelectionMethod;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(
        Symbols.palette_rounded,
      ),
      tooltip: 'Select a seed color',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      itemBuilder: (context) {
        return List.generate(ColorSeed.values.length, (index) {
          final ColorSeed currentColor = ColorSeed.values[index];

          return PopupMenuItem(
            value: index,
            enabled: currentColor != colorSelected ||
                colorSelectionMethod != ColorSelectionMethod.colorSeed,
            child: Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    currentColor == colorSelected &&
                            colorSelectionMethod != ColorSelectionMethod.image
                        ? Symbols.color_lens
                        : Symbols.color_lens_rounded,
                    color: currentColor.color,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(currentColor.label),
                ),
              ],
            ),
          );
        });
      },
      onSelected: handleColorSelect,
    );
  }
}
