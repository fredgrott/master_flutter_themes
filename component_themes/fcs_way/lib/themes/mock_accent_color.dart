

import 'package:fcs_way/themes/theme_tokens.dart';
import 'package:flutter/material.dart';

/// Just to mock accent color as 
/// our Color Scheme ThemeData set up
/// is used as a wrapper  to test widgets
/// and generate goldens for ux testing.
Color mockAccentColor() {
  return ThemeTokens.mockDynamicColor;


}
