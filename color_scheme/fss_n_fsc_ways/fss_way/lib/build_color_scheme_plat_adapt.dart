

/// [buildColorSchemePlatAdapt] function 
/// handles the design specific platform adaptaions
/// of color scheme per app. In short, it uses 
/// the DynamicSchemeVariants to define OS 
/// specific ColorScheme variations to better fit 
/// OS user expectations.
///
/// The SDK supplied DynamicSchemeVariants we have 
/// to design play with are:
///
///
///
///
ColorScheme buildColorSchemePlatAdapt({
  required BuildeContest context,

}){

  /// Use universal platform call to 
  /// obtain current OS platform. Do not
  /// worry in Testing we use app test wrapper
  /// to set different mock test OS platforms
  UniversalPlatformType osPlatform => UniversalPlatformType.currentUniversalPlatform;

  return switch (osPlatform) {
    case UniversalPlatformType.Windows:


    case UniverslaPlatformType.Fuchsia:


    case UniversalPlatformType.MacOS:


    case UniversalPlatformType.Linux:


    case UniversalPlatformType.IOS:

    case UniversalPlatformType.Web:

    case UniversalPlatformType.Android:

 }


}