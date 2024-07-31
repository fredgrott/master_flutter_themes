// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team

import 'package:flutter/material.dart';

import 'package:raw_md3_demo/app.dart';

final List _allList = [
  'assets/images/content_based_color_scheme_1.png',
  'assets/images/content_based_color_scheme_2.png',
  'assets/images/content_based_color_scheme_3.png',
  'assets/images/content_based_color_scheme_4.png',
  'assets/images/content_based_color_scheme_5.png',
  'assets/images/content_based_color_scheme_6.png',
  'assets/images/raw_icon_transparent_fg_300.png',
];

void main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();


  // pre cache images in assets for
  // many purposes including splash, etc.
  binding.deferFirstFrame();
  binding.addPostFrameCallback((_) async {
    final BuildContext context = binding.rootElement! as BuildContext;
    for (final asset in _allList) {
      precacheImage(AssetImage(asset as String), context);
    }
    binding.allowFirstFrame();
  });

  runApp(const App());
}
