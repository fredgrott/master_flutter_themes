


import 'package:fcs_way/themes/theme_tokens.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

/// Eventually this switches to 
/// CorePalettes at which point I would 
/// have to use MCU interanls to generate
/// the individual tone palette to mock
CorePalette mockCorePalette(){
  return CorePalette.of(ThemeTokens.mockDynamicColor.value);

}
