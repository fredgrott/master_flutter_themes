// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


// best practice wise we always do color seeds
// and brand colors in light mode.

import 'package:flutter/material.dart';

/// Color Seeds: In MD2 we used extensions methods in ThemeData to declare extra brand colors.
///                         However, in MD3 with the advent of dynamic colors through users wallpaper or
///                         accent color choice combined with Color Scheme and SDK moving away from elevations
///                         overlays but instead extra colors for active, dim, etc it makes sense to no longer 
///                         use raw brand colors as some part of the Color Scheme.
/// 
///                        A better UX choice is to have one of the theme choices to be where the brand colors 
///                        are used as seeds to generate the Color Scheme of the theme. In total the Theme 
///                        choices in app settings would be system, dynamic, and custom with custom being 
///                        the brand seed colors.
/// 
///                         Due to how the Hue Chroma Tone color space works the brand colors as seeds will 
///                          not generate brand colors as primary but a tone close to it. That means the UX 
///                          behavoir in relation to the app user is part of the brand definition. But as long as 
///                          the designer or developer works on polishing the UX of the app the brand will still
///                          shine through.
/// 
///                         This is even with using the Flex Seed Scheme or Flex Color Scheme packages 
///                         where the feature to use brand colors as keys which are kept as color exists 
///                         but generally was a hold-over from the way MD2 color spaces worked.


const Color primarySeedColor = Color(0xFF6750A4);
const Color secondarySeedColor = Color(0xFF3871BB);
const Color tertiarySeedColor = Color(0xFF6CA450);
