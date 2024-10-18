


/// To platform adapt the color scheme and its variant,
/// One uses a builder as we have to bind data to the 
/// view in the MVVM app arch scheme.
///
/// With this builder Color Scheme is adapted not just 
/// based on OS but in case of IOS high contrast as well.
/// To get the other OS specific Color Schemes I 
/// make use of custom Flex Seed Scheme Tones.
///
/// Engineering note-wise, we have to use the 
/// [WidgetsFlutterBinding] to grab highContrast 
/// boolean as this gets called before the [MaterialApp]
/// and thus we do not have a parent MediaQuery to 
/// grab.
///
/// So for the Material Like OS platforms we have
/// the normal DynamicScheme variants of:
///        TonalSpot (Material You default)
///        Fidelity
///        Monochrome (potenial IOS high contrast)
///        Neutral    (potential IOS high contrast)
///        Vibrant
///        Expresssive
///        Content
///        Rainbow
///        FruitSalad
///
/// Then the other FSS variants that one can set up
/// via reading source and making manual tones set up are:
///        Material
///        Material3Legacy
///        Soft
///        Vivid
///        VividSurfaces
///        HighContrast
///        UltraContrast
///        Jolly
///        VividBackground
///        OneHue
///        CandyPop
///        Chroma
///
///  One can do that manual or call FlexTones.name
class PlatformAdaptColorSchemeBuilder extends StatefulWidget {
  const PlafromAdaptColorSchemeBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final Widget Function(
    ColorScheme? platAdaptCSLight,
    ColorScheme? platAdaptCSDark,
  ) builder;

  @override
  PlatformAdaptColorSchemeBuilderState createState() => PlatformAdaptColorSchemeBuilderState();
}

class PlatformAdaptColorSchemeBuilderState extends State<PlatformAdaptColorSchemeBuilder>{
  ColorScheme? _lightCSAdapt;

  ColorScheme? _darkCSAdapt;

  bool isHighContrast = WidgetsBinding.instance.platformDispatcher.accessibilityFeatures.highContrast;

  
  UniversalPlatformType osPlatform => UniversalPlatformType.currentUniversalPlatform;



  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    switch (osPlatform){
      case UniversalPlatformType.Web:
         _lightCSAdapt = buildColorScheme(
            brightness: Brightness.light,
            primaryKey: appBrandKeyColorOne,
            variant: FlexSchemeVariant.content,
          )
         _darkCSAdapt = buildColorScheme(
            brightness: Brightness.dark,
            primaryKey: appBrandKeyColorOne,
            variant: FlexSchemeVariant.content,
         )

      case UniversalPlatformType.Fuschia:
         _lightCSAdapt = buildColorScheme(
            brightness: Brightness.light,
            primaryKey: appBrandKeyColorOne,
            variant: FlexSchemeVariant.fruitSalad,
          )
         _darkCSAdapt = buildColorScheme(
            brightness: Brightness.dark,
            primaryKey: appBrandKeyColorOne,
            variant: FlexSchemeVariant.fruitSalad,
         )


      case UniversalPlatformType.Linux:


      case UniversalPlatformType.Android:

      case UniversalPlatformType.Windows:

      case UniversalPlatformType.IOS:



   }

  }


  @override
  Widget build(BuildContext context) {
    return widget.builder(_lightCSAdapt, _darkCSAdapt);
  }



}