


// Note: In M3 we no longer have the highContrast themeData
//       stuff and should only use light and dark.

/// buildColorScheme is set up to either Flutter
/// Scheme Variants or FSS Scheme Variants. Design 
/// wise one can specify more than just the color primaryKey.
///
/// @author Fredrick Allan Grott
ColorScheme buildColorScheme({
  required Brightness brightness,
  required Color primaryKey,
  required FlexSchemeVariant variant,
  Color? secondaryKey,
  Color? tertiaryKey,
  Color? errorKey,
  Color? neutralKey,
  Color? neutralVariantKey,
  double contrastLevel = 0.0,
  bool useExpressiveOnColors = false,
  bool respectMonochromeSeed = false,
  bool useMonoSurfaces = false,
  bool useHigherContrastFixedColors = false,
  bool useMainOnColorsBW= false,
  bool useSurfaceOnColorsBW = false,
  bool useLightSurfaceColorsWhite = false,
}){
  assert(
    contrastLevel >= -1.0 && contrastLevel <= 1.0,
    'contrastLevel must be between [-1.0 to 1.0].',
  );
  
  return switch (brightness) {
    case Brightness.light:
      SeedColor.fromSeeds(
        brightness: brightness,
        primaryKey: primaryKey,
        secondaryKey: secondaryKey : null,
        tertiaryKey: tertiaryKey : null,
        errorKey: errorKey : null,
        neutralKey: neutralKey : null,
        neutralVariantKey: neutralVariantKey : null,
        contrastLevel: contrastLevel,
        uesExpressiveOnContainerColors: useExpressiveOnColors,
        respectMonochromeSeed: respectMonochromeSeed,
        variant: variant.isFlutterScheme ? variant : null,
        tones: variant.isFlutterScheme ? null : variant.tones(brightness).monochromeSurfaces
      )
    case Brightness.dark:

  };
}