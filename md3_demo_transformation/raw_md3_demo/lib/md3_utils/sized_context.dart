// license that can be found in the LICENSE file.
//
// Modification of GSkinner SizedContext package
// Under MIT License copyright 2019 by GSkinner

import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:raw_md3_demo/md3_utils/window_size.dart';
import 'package:universal_platform/universal_platform.dart';

extension SizedContext on BuildContext {
  double get pixelsPerInch => UniversalPlatform.isAndroid || UniversalPlatform.isIOS ? 150 : 96;

  MediaQueryData get mq => MediaQuery.of(this);

  /// Returns if Orientation is landscape
  bool get isLandscape => mq.orientation == Orientation.landscape;

  /// Returns same as MediaQuery.of(context).size
  ui.Size get sizePx => mq.size;

  /// Returns same as MediaQuery.of(context).size.width
  double get widthPx => sizePx.width;

  /// Returns same as MediaQuery.of(context).height
  double get heightPx => sizePx.height;

  /// Returns diagonal screen pixels
  double get diagonalPx {
    final ui.Size s = sizePx;
    return sqrt((s.width * s.width) + (s.height * s.height));
  }

  /// Returns pixel size in Inches
  Size get sizeInches {
    final Size pxSize = sizePx;
    return Size(pxSize.width / pixelsPerInch, pxSize.height / pixelsPerInch);
  }

  /// Returns screen width in Inches
  double get widthInches => sizeInches.width;

  /// Returns screen height in Inches
  double get heightInches => sizeInches.height;

  /// Returns screen diagonal in Inches
  double get diagonalInches => diagonalPx / pixelsPerInch;

  /// Returns fraction (0-1) of screen width in pixels
  double widthPct(double fraction) => fraction * widthPx;

  /// Returns fraction (0-1) of screen height in pixels
  double heightPct(double fraction) => fraction * heightPx;

  ///  so we can adjust content layout per mobile shortestSide
  ui.FlutterView get view => ui.PlatformDispatcher.instance.implicitView!;
  ui.Size get logicalSize => view.physicalSize / view.devicePixelRatio;
  double get shortestSide => logicalSize.shortestSide;

  /// isRTL bool as we need to specify text direction as 
  /// part of the two pane layout part of canonical layouts 
  /// as the two or more content panes will reverse layout 
  /// direction upon language direction of reading change
  bool isRTL() => Directionality.of(this) == ui.TextDirection.rtl;

  /// Returns an appWindowSize that contains the beginWidthRange, endWidthRange, margin, 
  /// middleSpacing, and dimens
  WindowSize get appWindowSize {
    if (mq.size.width >= WindowSize.compact.endWidthRange) {
      return WindowSize.compact;
    } else if (mq.size.width >= WindowSize.medium.endWidthRange) {
      return WindowSize.medium;
    } else if (mq.size.width >= WindowSize.expanded.endWidthRange) {
      return WindowSize.expanded;
    } else if (mq.size.width >= WindowSize.large.endWidthRange) {
      return WindowSize.large;
    } else {
      return WindowSize.extraLarge;
    }
  }
}
