// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:fcs_services/services/theme_service.dart';

class ThemeServiceMem implements ThemeService {
  @override
  Future<void> init() async {}

  @override
  Future<T> load<T>(String key, T defaultValue) async => defaultValue;

  @override
  Future<void> save<T>(String key, T value) async {}

  /// Get all stored key-value paris from the mem storage.
  @override
  Map<String, dynamic> getAll() {
    throw UnimplementedError();
  }

  /// Put all key-value pairs into the Mem storage.
  @override
  Future<void> putAll(
    Map<String, dynamic> values, {
    bool clearExisting = true,
  }) {
    throw UnimplementedError();
  }

  /// Clear all stored values.
  @override
  Future<void> clearAll() async {
    throw UnimplementedError();
  }
}
