// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:async';

import 'package:fcs_services/models/store.dart';
import 'package:fcs_services/services/theme_service.dart';
import 'package:flutter/material.dart';

/// Keep in mind we can do both MVC and MVVM
/// in Flutter. But, the State class is the MVC
/// Controller in form of a State Controller.
///
/// THis instead is a service controller.
///
/// @author Fredrick Allan Grott
class ThemeController with ChangeNotifier {
  ThemeController(this._themeService);

  final ThemeService _themeService;

  Future<void> loadAll() async {
    _themeMode = await _themeService.load(Store.keyThemeMode, Store.defaultThemeMode);

    notifyListeners();
  }

  late ThemeMode _themeMode;

  // Getter for the current ThemeMode.
  ThemeMode get themeMode => _themeMode;

  // Set and persist new ThemeMode value.
  void setThemeMode(ThemeMode? value, [bool notify = true]) {
    // No work if null value passed.
    if (value == null) return;
    // Do not perform any work if new and old value are identical.
    if (value == _themeMode) return;
    // Otherwise, assign new value to private property.
    _themeMode = value;
    // Inform all listeners a change has occurred, if notify flag is true.
    if (notify) notifyListeners();
    // Persist the change to whatever storage is used with the ThemeService.
    unawaited(_themeService.save(Store.keyThemeMode, value));
  }
}
