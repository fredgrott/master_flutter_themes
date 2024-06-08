











// Define your seed colors. Note, that 
// I approach dynamic color differently
// in that I use it blend my custom color
// schemes with the primary color of the 
// dynamic color rather than obliterate 
// my design twist of color scheme generation.
// Note, also best practice wise we always 
// only use light mode to provide our 
// seed colors and brand colors as both Flutter
// SDK color scheme and FSS, FCS color scheme 
// generation adjusts for it in how it interprets
// the HCT color space.
import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flex_seed_scheme_demo/custom_tones.dart';
import 'package:flutter/material.dart';

const Color primarySeedColor = Color(0xFF6750A4);
const Color secondarySeedColor = Color(0xFF3871BB);
const Color tertiarySeedColor = Color(0xFF6CA450);


// Make a light ColorScheme from the seeds.
final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
      brightness: Brightness.light,
      // Primary key color is required, like seed color ColorScheme.fromSeed.
      primaryKey: primarySeedColor,
      // You can add optional own seeds for secondary and tertiary key colors.
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      // Tone chroma config and tone mapping is optional, if you do not add it
      // you get the config matching Flutter's Material 3 ColorScheme.fromSeed.
      tones: myLightTones,
    );

final ColorScheme schemeHighContrast = SeedColorScheme.fromSeeds(
  brightness: Brightness.light,
      // Primary key color is required, like seed color ColorScheme.fromSeed.
      primaryKey: primarySeedColor,
      // You can add optional own seeds for secondary and tertiary key colors.
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      // Tone chroma config and tone mapping is optional, if you do not add it
      // you get the config matching Flutter's Material 3 ColorScheme.fromSeed.
      tones: FlexTones.ultraContrast(Brightness.light),

);

  // Make a dark ColorScheme from the seeds.
  final ColorScheme schemeDark = SeedColorScheme.fromSeeds(
      brightness: Brightness.dark,
      primaryKey: primarySeedColor,
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      tones: myDarkTones,
    );


final ColorScheme schemeDarkHighContrast = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
      // Primary key color is required, like seed color ColorScheme.fromSeed.
      primaryKey: primarySeedColor,
      // You can add optional own seeds for secondary and tertiary key colors.
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      // Tone chroma config and tone mapping is optional, if you do not add it
      // you get the config matching Flutter's Material 3 ColorScheme.fromSeed.
      tones: FlexTones.ultraContrast(Brightness.dark),

);
