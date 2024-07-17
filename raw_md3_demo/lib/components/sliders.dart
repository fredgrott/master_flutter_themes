// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:raw_md3_demo/components/component_decoration.dart';

//TODO: Update when the Dec 2023 MD3 slider updates
//      make it to the SDK...fall 2024?


class Sliders extends StatefulWidget {
  const Sliders({super.key});

  @override
  State<Sliders> createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  double sliderValue0 = 30.0;
  double sliderValue1 = 20.0;

  @override
  Widget build(BuildContext context) {
    return ComponentDecoration(
        label: 'Sliders',
        tooltipMessage: 'Use Slider or RangeSlider',
        child: Column(
          children: <Widget>[
            Slider(
              max: 100,
              value: sliderValue0,
              onChanged: (value) {
                setState(() {
                  sliderValue0 = value;
                });
              },
            ),
            const SizedBox(height: 20),
            Slider(
              max: 100,
              divisions: 5,
              value: sliderValue1,
              label: sliderValue1.round().toString(),
              onChanged: (value) {
                setState(() {
                  sliderValue1 = value;
                });
              },
            ),
          ],
        ),);
  }
}
