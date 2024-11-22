import 'package:fcs_way/app_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  // any futures executed here
  // keep the naive splash png
  // image up unit the futures return.
  // Perfect for caching images and 
  // google custom fonts.
  
  // pendingFonts returns a Future,
  // this is generally better than using 
  // the FutureBuilder which usally needs
  // initState from the Stateful.
  await GoogleFonts.pendingFonts([
    // checks AssetManifext first via the FontLoader
    // thus works with local google_fonts in
    // asset folder when specified in the pubspec.
    GoogleFonts.robotoSerif(),
    GoogleFonts.robotoFlex(),
  ]);

  runApp(const AppWrapper());
}
