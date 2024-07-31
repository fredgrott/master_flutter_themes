// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import 'package:raw_md3_demo/brightness_button.dart';
import 'package:raw_md3_demo/color_image_button.dart';
import 'package:raw_md3_demo/color_seed_button.dart';
import 'package:raw_md3_demo/components/app_bar_destinations.dart';
import 'package:raw_md3_demo/components/custom_first_component_list.dart';
import 'package:raw_md3_demo/components/custom_second_component_list.dart';
import 'package:raw_md3_demo/components/navigation_bars.dart';
import 'package:raw_md3_demo/constants.dart';
import 'package:raw_md3_demo/custom_color_palette_screen.dart';
import 'package:raw_md3_demo/custom_elevation_screen.dart';
import 'package:raw_md3_demo/custom_typography_screen.dart';
import 'package:raw_md3_demo/expanded_trailing_actions.dart';
import 'package:raw_md3_demo/material_3_button.dart';
import 'package:raw_md3_demo/nav_rail_destinations.dart';
import 'package:raw_md3_demo/navigation_transition.dart';
import 'package:raw_md3_demo/one_two_transition.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.useLightMode,
    required this.useMaterial3,
    required this.colorSelected,
    required this.handleBrightnessChange,
    required this.handleMaterialVersionChange,
    required this.handleColorSelect,
    required this.handleImageSelect,
    required this.colorSelectionMethod,
    required this.imageSelected,
  });

  final bool useLightMode;
  final bool useMaterial3;
  final ColorSeed colorSelected;
  final ColorImageProvider imageSelected;
  final ColorSelectionMethod colorSelectionMethod;

  final void Function(bool useLightMode) handleBrightnessChange;
  final void Function() handleMaterialVersionChange;
  final void Function(int value) handleColorSelect;
  final void Function(int value) handleImageSelect;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final AnimationController controller;
  late final CurvedAnimation railAnimation;
  bool controllerInitialized = false;
  bool showMediumSizeLayout = false;
  bool showLargeSizeLayout = false;

  int screenIndex = ScreenSelected.component.value;

  // for android foldables to prevent letterboxing
  bool unfolding = false;

 // Flutter SDK team does not have this correction in the Codelabs
 // responsive adaptive scaffold example. But, we need this to 
 // prevent letterboxing on Android foldables and something 
 // similar when the 2025 fall iPhone foldables come out to 
 // the market
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final view = PlatformDispatcher.instance.implicitView!;
    final logicalSize = view.physicalSize / view.devicePixelRatio;

    // Make sure app doesn't get letterboxed.
    if (!unfolding) {
      unfolding = view.displayFeatures.any(
        (DisplayFeature feature) => feature.state == DisplayFeatureState.postureHalfOpened,
      );
    } else {
      unfolding = !view.displayFeatures.any(
        (DisplayFeature feature) => feature.state == DisplayFeatureState.postureFlat,
      );
    }

    if (unfolding || logicalSize.shortestSide >= 600) {
      SystemChrome.setPreferredOrientations([]);
    } else if (logicalSize.shortestSide < 600) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: transitionLength.toInt() * 2),
      value: 0,
      vsync: this,
    );
    railAnimation = CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final double width = MediaQuery.of(context).size.width;
    final AnimationStatus status = controller.status;
    if (width > mediumWidthBreakpoint) {
      if (width > largeWidthBreakpoint) {
        showMediumSizeLayout = false;
        showLargeSizeLayout = true;
      } else {
        showMediumSizeLayout = true;
        showLargeSizeLayout = false;
      }
      if (status != AnimationStatus.forward && status != AnimationStatus.completed) {
        controller.forward();
      }
    } else {
      showMediumSizeLayout = false;
      showLargeSizeLayout = false;
      if (status != AnimationStatus.reverse && status != AnimationStatus.dismissed) {
        controller.reverse();
      }
    }
    if (!controllerInitialized) {
      controllerInitialized = true;
      controller.value = width > mediumWidthBreakpoint ? 1 : 0;
    }
  }

  void handleScreenChanged(int screenSelected) {
    setState(() {
      screenIndex = screenSelected;
    });
  }

  Widget createScreenFor(
    ScreenSelected screenSelected,
    bool showNavBarExample,
  ) =>
      switch (screenSelected) {
        ScreenSelected.component => Expanded(
            child: OneTwoTransition(
              animation: railAnimation,
              one: CustomFirstComponentList(
                showNavBottomBar: showNavBarExample,
                scaffoldKey: scaffoldKey,
                showSecondList: showMediumSizeLayout || showLargeSizeLayout,
              ),
              two: CustomSecondComponentList(
                scaffoldKey: scaffoldKey,
              ),
            ),
          ),
        ScreenSelected.color => const CustomColorPaletteScreen(),
        ScreenSelected.typography => const CustomTypographyScreen(),
        ScreenSelected.elevation => const CustomElevationScreen()
      };

  // chaning up fomr the way Flutter SDK team had it
  // as one of the ways to highlight UX animation is eye candy
  // in the form of drawing user eye movement towards something
  PreferredSizeWidget createAppBar(BuildContext context) {
    // Generally, to prepare for chaining animation need to set a new variable
    // that will be used to chain the animations.
    Widget title = widget.useMaterial3 ? const Text('Material 3') : const Text('Material 2');

    title = title
        .animate(
          delay: 500.ms,
          onPlay: (controller) => controller.repeat(),
        )
        .shimmer(delay: 250.ms, duration: 850.ms, color: Theme.of(context).colorScheme.primary);

    return AppBar(
      bottomOpacity: 0.8,
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHigh.withOpacity(0.2),
      title: title,
      actions: !showMediumSizeLayout && !showLargeSizeLayout
          ? [
              BrightnessButton(
                handleBrightnessChange: widget.handleBrightnessChange,
              ),
              Material3Button(
                handleMaterialVersionChange: widget.handleMaterialVersionChange,
              ),
              ColorSeedButton(
                handleColorSelect: widget.handleColorSelect,
                colorSelected: widget.colorSelected,
                colorSelectionMethod: widget.colorSelectionMethod,
              ),
              ColorImageButton(
                handleImageSelect: widget.handleImageSelect,
                imageSelected: widget.imageSelected,
                colorSelectionMethod: widget.colorSelectionMethod,
              ),
            ]
          : [Container()],
    );
  }

  Widget trailingActions() => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Flexible(
            child: BrightnessButton(
              handleBrightnessChange: widget.handleBrightnessChange,
              showTooltipBelow: false,
            ),
          ),
          Flexible(
            child: Material3Button(
              handleMaterialVersionChange: widget.handleMaterialVersionChange,
              showTooltipBelow: false,
            ),
          ),
          Flexible(
            child: ColorSeedButton(
              handleColorSelect: widget.handleColorSelect,
              colorSelected: widget.colorSelected,
              colorSelectionMethod: widget.colorSelectionMethod,
            ),
          ),
          Flexible(
            child: ColorImageButton(
              handleImageSelect: widget.handleImageSelect,
              imageSelected: widget.imageSelected,
              colorSelectionMethod: widget.colorSelectionMethod,
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    // I need to grab appBarDestinations
    // so I can animate selectedIcons
    

    appBarDestinations = [
      NavigationDestination(
        tooltip: 'Components',
        icon: const Icon(Symbols.widgets_rounded),
        label: 'Components',
        selectedIcon: const Icon(Symbols.widgets)
            .animate()
            .rotate(duration: Durations.medium4, curve: Curves.slowMiddle),
      ),
      NavigationDestination(
        tooltip: 'Color',
        icon: const Icon(Symbols.format_paint_rounded),
        label: 'Color',
        selectedIcon: const Icon(Symbols.format_paint)
            .animate()
            .rotate(duration: Durations.medium4, curve: Curves.slowMiddle),
      ),
      NavigationDestination(
        tooltip: 'Typography',
        icon: const Icon(Symbols.text_snippet_rounded),
        label: 'Typography',
        selectedIcon: const Icon(Symbols.text_snippet)
            .animate()
            .rotate(duration: Durations.medium4, curve: Curves.slowMiddle),
      ),
      NavigationDestination(
        tooltip: 'Elevation',
        icon: const Icon(Symbols.invert_colors_rounded),
        label: 'Elevation',
        selectedIcon: const Icon(Symbols.opacity)
            .animate()
            .rotate(duration: Durations.medium4, curve: Curves.slowMiddle),
      ),
    ];
    
    
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return NavigationTransition(
          scaffoldKey: scaffoldKey,
          animationController: controller,
          railAnimation: railAnimation,
          appBar: createAppBar(context),
          body: createScreenFor(
            ScreenSelected.values[screenIndex],
            controller.value == 1,
          ),
          navigationRail: NavigationRail(
            extended: showLargeSizeLayout,
            destinations: navRailDestinations!,
            selectedIndex: screenIndex,
            onDestinationSelected: (index) {
              setState(() {
                screenIndex = index;
                handleScreenChanged(screenIndex);
              });
            },
            trailing: Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: showLargeSizeLayout
                    ? ExpandedTrailingActions(
                        useLightMode: widget.useLightMode,
                        handleBrightnessChange: widget.handleBrightnessChange,
                        useMaterial3: widget.useMaterial3,
                        handleMaterialVersionChange: widget.handleMaterialVersionChange,
                        handleImageSelect: widget.handleImageSelect,
                        handleColorSelect: widget.handleColorSelect,
                        colorSelectionMethod: widget.colorSelectionMethod,
                        imageSelected: widget.imageSelected,
                        colorSelected: widget.colorSelected,
                      )
                    : trailingActions(),
              ),
            ),
          ),
          navigationBar: NavigationBars(
            onSelectItem: (index) {
              setState(() {
                screenIndex = index;
                handleScreenChanged(screenIndex);
              });
            },
            selectedIndex: screenIndex,
            isExampleBar: false,
          ),
        );
      },
    );
  }
}
