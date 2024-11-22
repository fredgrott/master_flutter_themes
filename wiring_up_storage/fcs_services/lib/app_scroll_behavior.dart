// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from GSkinner's Flutter Vignettes which
// is under MIT License and copyrighted 2019

// Add support for testing drag gestures on desktop
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AppScrollBehavior extends ScrollBehavior {
  @override
  // modified to cover all devices
  Set<PointerDeviceKind> get dragDevices {
    final devices = Set<PointerDeviceKind>.from(super.dragDevices);
    devices.add(PointerDeviceKind.mouse);
    devices.add(PointerDeviceKind.touch);
    devices.add(PointerDeviceKind.stylus);
    devices.add(PointerDeviceKind.trackpad);
    devices.add(PointerDeviceKind.invertedStylus);
    return devices;
  }
}
