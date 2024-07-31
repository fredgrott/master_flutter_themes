// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:raw_md3_demo/components/color_item.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';

class SearchAnchors extends StatefulWidget {
  const SearchAnchors({super.key});

  @override
  State<SearchAnchors> createState() => _SearchAnchorsState();
}

class _SearchAnchorsState extends State<SearchAnchors> {
  String? selectedColor;
  List<ColorItem> searchHistory = <ColorItem>[];

  Iterable<Widget> getHistoryList(SearchController controller) {
    return searchHistory.map((color) => ListTile(
          leading: const Icon(Icons.history),
          title: Text(color.label),
          trailing: IconButton(
              icon: const Icon(Symbols.call_missed),
              onPressed: () {
                controller.text = color.label;
                controller.selection =
                    TextSelection.collapsed(offset: controller.text.length);
              },),
          onTap: () {
            controller.closeView(color.label);
            handleSelection(color);
          },
        ),);
  }

  Iterable<Widget> getSuggestions(SearchController controller) {
    final String input = controller.value.text;
    return ColorItem.values
        .where((color) => color.label.contains(input))
        .map((filteredColor) => ListTile(
              leading: CircleAvatar(backgroundColor: filteredColor.color),
              title: Text(filteredColor.label),
              trailing: IconButton(
                  icon: const Icon(Symbols.call_missed),
                  onPressed: () {
                    controller.text = filteredColor.label;
                    controller.selection =
                        TextSelection.collapsed(offset: controller.text.length);
                  },),
              onTap: () {
                controller.closeView(filteredColor.label);
                handleSelection(filteredColor);
              },
            ),);
  }

  void handleSelection(ColorItem color) {
    setState(() {
      selectedColor = color.label;
      if (searchHistory.length >= 5) {
        searchHistory.removeLast();
      }
      searchHistory.insert(0, color);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Search',
      tooltipMessage: 'Use SearchAnchor or SearchAnchor.bar',
      child: Column(
        children: <Widget>[
          SearchAnchor.bar(
            barHintText: 'Search colors',
            suggestionsBuilder: (context, controller) {
              if (controller.text.isEmpty) {
                if (searchHistory.isNotEmpty) {
                  return getHistoryList(controller);
                }
                return <Widget>[
                  const Center(
                    child: Text('No search history.',
                        style: TextStyle(color: Colors.grey),),
                  ),
                ];
              }
              return getSuggestions(controller);
            },
          ),
          const SizedBox(height: 20),
          if (selectedColor == null)
            const Text('Select a color')
          else
            Text('Last selected color is $selectedColor'),
        ],
      ),
    );
  }
}
