

import 'package:flutter/material.dart';

/// [BrandColors] to include in ThemeData via
/// dart extension methods. Access in UI via:
///
/// ```
///  final BrandColors brandColors = Theme.of(context).extension<BrandColors>()!;
///
///    brandColors.brandColorOne
/// ```
///
/// @author Fredrick Allan Grott
class BrandColors extends ThemeExtension<BrandColors> {

  const BrandColors({
    required this.brandColorOne,
    required this.brandColorTwo,
    required this.brandColorThree,
  });

  final Color? brandColorOne;
  final Color? brandColorTwo;
  final Color? brandColorThree;

  @override
  BrandColors copyWith({Color? brandColorOne, Color? brandColorTwo, Color? brandColorThree}) {
    return BrandColors(
      brandColorOne: brandColorOne ?? this.brandColorOne,
      brandColorTwo: brandColorTwo ?? this.brandColorTwo,
      brandColorThree: brandColorThree ?? this.brandColorThree,
    );
  }

  @override
  BrandColors lerp(BrandColors? other, double t) {
    if (other is! BrandColors) {
      return this;
    }
    return BrandColors(
      brandColorOne: Color.lerp(brandColorOne, other.brandColorOne, t),
      brandColorTwo: Color.lerp(brandColorTwo, other.brandColorTwo, t),
      brandColorThree: Color.lerp(brandColorThree, other.brandColorThree, t),
    );
  }

  // when this gets upgraded for dynamic color
  // support harmonized method goes here

  @override
  String toString()=> "BrandColors(brandColorOne: $brandColorOne, brandColorTwo: $brandColorTwo, brandColorThree: $brandColorThree)";
}