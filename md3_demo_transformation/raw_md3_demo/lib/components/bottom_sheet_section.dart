// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';

class BottomSheetSection extends StatefulWidget {
  const BottomSheetSection({super.key});

  @override
  State<BottomSheetSection> createState() => _BottomSheetSectionState();
}

class _BottomSheetSectionState extends State<BottomSheetSection> {
  bool isNonModalBottomSheetOpen = false;
  PersistentBottomSheetController? _nonModalBottomSheetController;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonList = <Widget>[
      IconButton(onPressed: () {}, icon: const Icon(Symbols.share_sharp)),
      IconButton(onPressed: () {}, icon: const Icon(Symbols.add)),
      IconButton(onPressed: () {}, icon: const Icon(Symbols.delete_outline)),
      IconButton(onPressed: () {}, icon: const Icon(Symbols.archive_sharp)),
      IconButton(onPressed: () {}, icon: const Icon(Symbols.settings_sharp)),
      IconButton(onPressed: () {}, icon: const Icon(Symbols.favorite_border)),
    ];
    const List<Text> labelList = <Text>[
      Text('Share'),
      Text('Add to'),
      Text('Trash'),
      Text('Archive'),
      Text('Settings'),
      Text('Favorite'),
    ];

    buttonList = List.generate(
        buttonList.length,
        (index) => Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
              child: Column(
                // ignore: avoid_redundant_argument_values
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buttonList[index],
                  labelList[index],
                ],
              ),
            ),);

    return ComponentDecoration(
      label: 'Bottom sheet',
      tooltipMessage: 'Use showModalBottomSheet<T> or showBottomSheet<T>',
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          TextButton(
            child: const Text(
              'Show modal bottom sheet',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              showModalBottomSheet<void>(
                // yes show this
                sheetAnimationStyle: AnimationStyle(
                  curve: Curves.easeInOutCubicEmphasized,
                  duration: Durations.extralong1,
                  reverseCurve: Curves.easeOutCubic,
                  reverseDuration: Durations.extralong1,
                ),
                showDragHandle: true,
                context: context,
                // TODO: Remove when this is in the framework https://github.com/flutter/flutter/issues/118619
                constraints: const BoxConstraints(maxWidth: 640),
                builder: (context) {
                  return SizedBox(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: buttonList,
                      ),
                    ),
                  );
                },
              );
            },
          ),
          TextButton(
            child: Text(
              isNonModalBottomSheetOpen
                  ? 'Hide bottom sheet'
                  : 'Show bottom sheet',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (isNonModalBottomSheetOpen) {
                _nonModalBottomSheetController?.close();
                setState(() {
                  isNonModalBottomSheetOpen = false;
                });
                return;
              } else {
                setState(() {
                  isNonModalBottomSheetOpen = true;
                });
              }

              _nonModalBottomSheetController = showBottomSheet(
                // yes show this
                sheetAnimationStyle: AnimationStyle(
                  curve: Curves.easeInOutCubicEmphasized,
                  duration: Durations.extralong1,
                  reverseCurve: Curves.easeOutCubic,
                  reverseDuration: Durations.extralong1,
                ),
                elevation: 8.0,
                context: context,
                // TODO: Remove when this is in the framework https://github.com/flutter/flutter/issues/118619
                constraints: const BoxConstraints(maxWidth: 640),
                builder: (context) {
                  return SizedBox(
                    height: 150,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32.0),
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: buttonList,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
