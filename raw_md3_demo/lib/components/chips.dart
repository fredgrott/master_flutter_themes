// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';
import 'package:raw_md3_demo/constants.dart';

class Chips extends StatefulWidget {
  const Chips({super.key});

  @override
  State<Chips> createState() => _ChipsState();
}

class _ChipsState extends State<Chips> {
  bool isFiltered = true;

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Chips',
      tooltipMessage:
          'Use ActionChip, FilterChip, or InputChip. \nActionChip can also be used for suggestion chip',
      child: Column(
        // ignore: avoid_redundant_argument_values
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Wrap(
            spacing: smallSpacing,
            runSpacing: smallSpacing,
            children: <Widget>[
              ActionChip(
                label: const Text('Assist'),
                avatar: const Icon(Icons.event),
                onPressed: () {},
              ),
              FilterChip(
                label: const Text('Filter'),
                selected: isFiltered,
                onSelected: (selected) {
                  setState(() => isFiltered = selected);
                },
              ),
              InputChip(
                label: const Text('Input'),
                onPressed: () {},
                onDeleted: () {},
              ),
              ActionChip(
                label: const Text('Suggestion'),
                onPressed: () {},
              ),
            ],
          ),
          colDivider,
          Wrap(
            spacing: smallSpacing,
            runSpacing: smallSpacing,
            children: <Widget>[
              const ActionChip(
                label: Text('Assist'),
                avatar: Icon(Icons.event),
              ),
              FilterChip(
                label: const Text('Filter'),
                selected: isFiltered,
                onSelected: null,
              ),
              InputChip(
                label: const Text('Input'),
                onDeleted: () {},
                isEnabled: false,
              ),
              const ActionChip(
                label: Text('Suggestion'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
