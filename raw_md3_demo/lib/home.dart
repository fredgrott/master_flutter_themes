// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from the Flutter Samples Material Demo
// Copyright 2021 under BSD license by Flutter Team



import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:raw_md3_demo/brightness_button.dart';
import 'package:raw_md3_demo/color_image_button.dart';
import 'package:raw_md3_demo/color_seed_button.dart';
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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final AnimationController controller;
  late final CurvedAnimation railAnimation;
  bool controllerInitialized = false;
  bool showMediumSizeLayout = false;
  bool showLargeSizeLayout = false;

  int screenIndex = ScreenSelected.component.value;

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

   // grab a scroll controller for better 
   // title animation synched with scroll
   final ScrollController  myScrollController = PrimaryScrollController.of(context);

    // Generally, to prepare for chaining animation need to set a new variable
    // that will be used to chain the animations.
    Widget title = widget.useMaterial3 ? const Text('Material 3') : const Text('Material 2');

    title = title
    .animate(adapter: ScrollAdapter(myScrollController, animated: true))
    .shimmer(duration: 1200.ms, color: Theme.of(context).colorScheme.primaryFixedDim)
    .animate()
    .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad,);

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
            destinations: navRailDestinations,
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
