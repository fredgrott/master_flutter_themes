// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:fcs_services/app_wrapper.dart';
import 'package:fcs_services/controllers/theme_controller.dart';
import 'package:fcs_services/services/theme_service.dart';
import 'package:fcs_services/services/theme_service_hive.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final ThemeService themeService = ThemeServiceHive('demo') as ThemeService;

  
  // Initialize the theme service.
  await themeService.init();
  // Create a ThemeViewModel that uses the ThemeService.
  final ThemeController themeController = ThemeController(themeService);
  // Load preferred theme settings, while the app is loading, before MaterialApp
  // is created, this prevents a theme change when the app is first displayed.
  await themeController.loadAll();

  // Only use Google fonts via asset provided fonts.
  GoogleFonts.config.allowRuntimeFetching = false;

  // Add font license info for used fonts from Google fonts.
  LicenseRegistry.addLicense(() async* {
    final String license = await rootBundle.loadString('assets/google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  });

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

  runApp(AppWrapper(themeController: themeController));
}
