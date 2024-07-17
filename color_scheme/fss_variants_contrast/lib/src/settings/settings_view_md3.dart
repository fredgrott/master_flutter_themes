// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

enum ThemeModeLabel {
  lightMode("Light Theme"),
  darkMode("Dark Theme"),
  systemMode("System Theme");

  final String label;

  const ThemeModeLabel(this.label);
}

class SettingsViewMD3 extends StatefulWidget {
  const SettingsViewMD3({super.key});

  @override
  State<SettingsViewMD3> createState() => _SettingsViewMD3State();
}

class _SettingsViewMD3State extends State<SettingsViewMD3> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
