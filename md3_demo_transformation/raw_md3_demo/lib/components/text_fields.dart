// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team




import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:raw_md3_demo/components/clear_button.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';
import 'package:raw_md3_demo/constants.dart';

class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {
  final TextEditingController _controllerFilled = TextEditingController();
  final TextEditingController _controllerOutlined = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
      label: 'Text fields',
      tooltipMessage: 'Use TextField with different InputDecoration',
      child: Column(
        // ignore: avoid_redundant_argument_values
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(smallSpacing),
            child: TextField(
              controller: _controllerFilled,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: ClearButton(controller: _controllerFilled),
                labelText: 'Filled',
                hintText: 'hint text',
                helperText: 'supporting text',
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(smallSpacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      maxLength: 10,
                      maxLengthEnforcement: MaxLengthEnforcement.none,
                      controller: _controllerFilled,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: ClearButton(controller: _controllerFilled),
                        labelText: 'Filled',
                        hintText: 'hint text',
                        helperText: 'supporting text',
                        filled: true,
                        errorText: 'error text',
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: smallSpacing),
                Flexible(
                  child: SizedBox(
                    width: 200,
                    child: TextField(
                      controller: _controllerFilled,
                      enabled: false,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: ClearButton(controller: _controllerFilled),
                        labelText: 'Disabled',
                        hintText: 'hint text',
                        helperText: 'supporting text',
                        filled: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(smallSpacing),
            child: TextField(
              controller: _controllerOutlined,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: ClearButton(controller: _controllerOutlined),
                labelText: 'Outlined',
                hintText: 'hint text',
                helperText: 'supporting text',
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(smallSpacing),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          controller: _controllerOutlined,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon:
                                ClearButton(controller: _controllerOutlined),
                            labelText: 'Outlined',
                            hintText: 'hint text',
                            helperText: 'supporting text',
                            errorText: 'error text',
                            border: const OutlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: smallSpacing),
                    Flexible(
                      child: SizedBox(
                        width: 200,
                        child: TextField(
                          controller: _controllerOutlined,
                          enabled: false,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon:
                                ClearButton(controller: _controllerOutlined),
                            labelText: 'Disabled',
                            hintText: 'hint text',
                            helperText: 'supporting text',
                            border: const OutlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],),),
        ],
      ),
    );
  }
}
