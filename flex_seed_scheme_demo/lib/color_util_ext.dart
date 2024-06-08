import 'package:flutter/material.dart';

/// [ColorUtilExt] to provide methods to
/// lighten or darken as the best practice is to
/// use light mode brand colors rather than figure out
/// both light and dark. Hence these methods.
///
/// @author Fredrick Allan Grott
extension ColorUtilExt on Color {
  /// Makes the color lighter (more white), by the given [value], from `0` (no change) to `1` (white).
  /// If [value] is not provided, it will be 0.5 (50% change).
  /// If [value] is less than 0, it's 0. If more than 1, it's 1.
  /// Doesn't change the opacity.
  ///
  /// See also: [ChangeColors]
  ///
  Color lighter([double value = 0.5]) => Color.lerp(this, Colors.white, _limit(value))!.withAlpha(alpha);

  /// Makes the color darker (more black), by the given [value], from `0` (no change) to `1` (black).
  /// If [value] is not provided, it will be 0.5 (50% change).
  /// If [value] is less than 0, it's 0. If more than 1, it's 1.
  /// Doesn't change the opacity.
  ///
  /// See also: [ChangeColors]
  ///
  Color darker([double value = 0.5]) => Color.lerp(this, Colors.black, _limit(value))!.withAlpha(alpha);

  double _limit(double value) => (value < 0) ? 0 : (value > 1 ? 1 : value);
}
