// Copyright 2024 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from Mike Rydstrom's Flex Color Scheme
// under BSD 3-clauselicnese Copyright 2023

import 'package:flutter/material.dart';
import 'package:fss_variants_contrast/src/themes/color_extensions.dart';
import 'package:fss_variants_contrast/src/themes/scheme_color.dart';
import 'package:fss_variants_contrast/src/themes/theme_constants.dart';

enum CustomInputBorderType {
  /// Used to select [OutlineInputBorder] as input decorator in
  /// [FlexSubThemes.inputDecorationTheme].
  outline,

  /// Used to select [UnderlineInputBorder] as input decorator in
  /// [FlexSubThemes.inputDecorationTheme].
  underline,
}

InputDecorationTheme inputDecorationTheme({

  /// Typically the same [ColorScheme] that is also use for your [ThemeData].
  required ColorScheme colorScheme,

  /// Optional provided effective TextTheme to use as base for the
  /// input decorations.
  ///
  /// A default one is used if not provided.
  TextTheme? textTheme,

  /// Selects which color from the passed in colorScheme to use for the border
  /// and fill color of the input decorator.
  ///
  /// All colors in the color scheme are not good choices, but some work well.
  /// You can give the border a separate color value by defining
  /// [borderSchemeColor].
  ///
  /// If not defined, [colorScheme.primary] will be used.
  SchemeColor? baseSchemeColor,

  /// The decorated input fields corner border radius.
    ///
    /// If not defined, in Material 2 mode defaults to [kInputDecoratorRadius]
    /// which is 16, in Material 3 mode it defaults to
    /// [kInputDecoratorM3Radius] which is 4, following the Material
    /// 3 design specification.
    double? radius,

    /// Selects input border type.
    ///
    /// If undefined, defaults to [FlexInputBorderType.outline].
    CustomInputBorderType? borderType,

    /// The padding for the input decoration's container.
    ///
    /// The decoration's container is the area which is filled if
    /// [InputDecoration.filled] is true and bordered per the [border].
    /// It's the area adjacent to [InputDecoration.icon] and above the
    /// [InputDecoration.icon] and above the widgets that contain
    /// [InputDecoration.helperText], [InputDecoration.errorText], and
    /// [InputDecoration.counterText].
    ///
    /// By default the [contentPadding] reflects [isDense] and the type of the
    /// [border]. If [isCollapsed] is true then [contentPadding] is
    /// [EdgeInsets.zero].
    ///
    /// When [isDense] is true, the content padding can be made smaller and
    /// tighter than when it is false.
    ///
    /// If no [contentPadding] is given, Flutter SDK uses default padding values
    /// that depends on if [isDense] is true or false and if we use outline or
    /// underline border.
    EdgeInsetsGeometry? contentPadding,

    /// Whether the input decorator's child is part of a dense form (i.e., uses
    /// less vertical space).
    ///
    /// Defaults to false.
    bool? isDense,

    /// If true the decoration's container is filled with [fillColor].
    ///
    /// Typically this field set to true if [border] is an
    /// [UnderlineInputBorder].
    ///
    /// The decoration's container is the area, defined by the border's
    /// [InputBorder.getOuterPath], which is filled if [filled] is
    /// true and bordered per the [border].
    ///
    /// Defaults to true.
    bool? filled,

    /// An optional totally custom fill color used to fill the
    /// `InputDecorator` background with, when `filled` is true.
    ///
    /// If null, defaults to color scheme color defined by `baseColor`
    /// withAlpha(0x0D) (5%) if color scheme is light and withAlpha(0x14) (8%)
    /// if color scheme is dark.
    Color? fillColor,

    /// Defines the alpha, opacity channel value used as opacity on effective
    /// [InputDecorator] background color.
    ///
    /// If defined, the valid range is 0 to 255 (0x00 to 0xFF), if out of bounds
    /// it is capped to closest valid value.
    ///
    /// If not defined, in M3 mode it defaults to 0xFF fully opaque. In M2 mode
    /// defaults to [kFillColorAlphaLight] (0x0D = 5% opacity) in light theme
    /// and to [kFillColorAlphaDark] (0x14 = 8% opacity) in dark mode.
    int? backgroundAlpha,

    /// The icon color of the prefixIcon in a focused [InputDecoration].
    ///
    /// If not defined defaults to [baseSchemeColor] in FCS M2 and to
    /// [SchemeColor.onSurface] in FCS M3.
    SchemeColor? prefixIconSchemeColor,

    /// Selects which color from the passed in colorScheme to use as the border
    /// color of the input decorator.
    ///
    /// The color is used by the focused border, but also as slight opacity
    /// based color on unfocused border, when [unfocusedHasBorder] and
    /// [unfocusedBorderIsColored] are true.
    ///
    /// All colors in the color scheme are not good choices, but some work well.
    ///
    /// If not defined, [baseSchemeColor] will be used.
    SchemeColor? borderSchemeColor,

    /// The border width when the input is selected.
    ///
    /// If null, defaults to [kThickBorderWidth] = 2.
    double? focusedBorderWidth,

    /// The border width when the input is unselected or disabled.
    ///
    /// If null, defaults to [kThinBorderWidth] = 1.
    double? unfocusedBorderWidth,

    /// Horizontal padding on either side of the border's
    /// [InputDecoration.labelText] width gap.
    ///
    /// Defaults to 4, which is also the default in SDK default input decorator.
    double gapPadding = 4,

    /// Unfocused input decoration has a border.
    ///
    /// Defaults to true.
    ///
    /// Applies to both outline and underline mode. You would typically
    /// use this in a design where you use a fill color and want unfocused
    /// input fields to only be highlighted by the fill color and not even
    /// have an unfocused input border style.
    ///
    /// When set to false, there is no border bored on states enabledBorder and
    /// disabledBorder, there is a border on focusedBorder, focusedErrorBorder
    /// and errorBorder, so error thus has a border also when it is not focused.
    bool unfocusedHasBorder = true,

    /// Focused input decoration has a border.
    ///
    /// Defaults to true.
    ///
    /// Applies to both outline and underline mode. You would typically
    /// use this in a design where you use a fill color and want focused
    /// input fields to only be highlighted by the fill color and not even
    /// have an unfocused input border style.
    ///
    /// When set to false, there is no border bored on states enabledBorder and
    /// disabledBorder, there is a border on focusedBorder, focusedErrorBorder
    /// and errorBorder, so error thus has a border also when it is not focused.
    bool focusedHasBorder = true,

    /// Unfocused input decoration border uses the color baseScheme color.
    ///
    /// Applies to both outline and underline mode.
    ///
    /// When set to true, the unfocused borders also uses the [baseSchemeColor]
    /// as its border color, but with alpha [kEnabledBorderAlpha] (90%).
    ///
    /// If set to false, the color uses the SDK default unselected border color,
    /// which is [ColorScheme.onSurface] with 38% opacity.
    ///
    /// The unfocused border color selection also applies to it hovered state.
    ///
    /// Defaults to true.
    bool unfocusedBorderIsColored = true,

    /// Defines if the theme uses tinted interaction effects.
    ///
    /// If undefined, defaults to false.
    bool? tintedInteractions,

    /// Defines if the theme uses tinted disabled color.
    ///
    /// If undefined, defaults to false.
    bool? tintedDisabled,

    /// A temporary flag used to opt-in to Material 3 features.
    ///
    /// If set to true, the theme will use Material3 default styles when
    /// properties are undefined, if false defaults will use FlexColorScheme's
    /// own opinionated default values.
    ///
    /// The M2/M3 defaults will only be used for properties that are not
    /// defined, if defined they keep their defined values.
    ///
    /// If undefined, defaults to false.
    bool? useMaterial3,
}) {

  // match sdk default
  final bool useM3 = useMaterial3 ?? true;
  final bool tintInteract = tintedInteractions ?? false;
  final bool tintDisable = tintedDisabled ?? false;

  // Used color scheme is for dark mode.
  final bool isDark = colorScheme.brightness == Brightness.dark;

  // Get selected color, defaults to primary.
  final Color baseColor =
        schemeColor(baseSchemeColor ?? SchemeColor.primary, colorScheme);

  // Used border color, for focus and unfocused when that option is used.
  final Color borderColor = schemeColor(
        borderSchemeColor ?? baseSchemeColor ?? SchemeColor.primary,
        colorScheme,);

  // Get effective alpha value for background color.
  final int effectiveAlpha = backgroundAlpha?.clamp(0, 255) ??
        (useM3
            ? 0xFF
            : isDark
                ? kFillColorAlphaDark
                : kFillColorAlphaLight);

  // Tinted disabled colors
  final Color tintDisabledColor =
        tintedDisable(colorScheme.onSurface, fillColor ?? baseColor);
  final Color tintDisabledUltraLowColor =
        tintedDisable(colorScheme.onSurface, fillColor ?? baseColor)
            .withAlpha(kAlphaUltraLowDisabled);

  // Effective used fill color, can also be a totally custom color value.
  // These alpha blends remove the actual opacity and create a none opaque
  // color of the result of as if InputDecorator was used on surface color.
  // Usually this is close enough. This operations makes it possible to
  // use a simple lighter and dark color color of this net effect for
  // the hover effect, which is also actually not transparent.
  final Color usedFillColor = fillColor != null
        ? Color.alphaBlend(
            fillColor.withAlpha(effectiveAlpha), colorScheme.surface,)
        : WidgetStateColor.resolveWith((Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return tintDisable
                  ? tintDisabledUltraLowColor
                  : colorScheme.onSurface
                      .withAlpha(kAlphaUltraLowDisabled); // M3 spec, 4%, 0x0A
            }
            return baseSchemeColor == null && useM3
                ? Color.alphaBlend(
                  //no longr surfaceVariant
                    colorScheme.surfaceContainerHighest.withAlpha(effectiveAlpha),
                    colorScheme.surface,)
                : Color.alphaBlend(
                    baseColor.withAlpha(effectiveAlpha), colorScheme.surface,);
          });

  // A custom lighter and darker version of the effective background
  // color on the input decorator as hover color. This is a different formula
  // than otherwise used for the overall based hover colors by FCS. It was the
  // only way it was possible to make a nice tinted version that worked well
  // with any config that it is possible to create for the background on
  // the InputDecorator.
  final Color tintedHover =
        ThemeData.estimateBrightnessForColor(usedFillColor) == Brightness.light
            ? usedFillColor.darken(kInputDecoratorLightBgDarken)
            : usedFillColor.lighten(kInputDecoratorDarkBgLighten);

  // PrefixIconColor
  final SchemeColor prefixFallback =
        useM3 ? SchemeColor.onSurface : baseSchemeColor ?? SchemeColor.primary;
  final Color prefixIconColor =
        schemeColor(prefixIconSchemeColor ?? prefixFallback, colorScheme);

  // Flutter SDK "magic" theme colors from ThemeData, with old M1/M2 roots.
  final Color hintColorM2 =
        isDark ? Colors.white60 : Colors.black.withAlpha(kTintHover); // 60%
  final Color suffixIconColorM2 = isDark ? Colors.white70 : Colors.black45;
  final Color disabledColorM2 = isDark ? Colors.white38 : Colors.black38;

  // Enabled border color.
  final Color enabledBorder = unfocusedBorderIsColored
        ? borderColor.withAlpha(kEnabledBorderAlpha)
        : useM3
            ? borderType == CustomInputBorderType.underline
                ? colorScheme.onSurfaceVariant
                : colorScheme.outline
            : colorScheme.onSurface.withAlpha(kAlphaDisabled);

  // Default border radius.
  final double effectiveRadius =
        radius ?? (useM3 ? kInputDecoratorM3Radius : kInputDecoratorRadius);

  // Default outline widths.
  final double unfocusedWidth = unfocusedBorderWidth ?? kThinBorderWidth;
  final double focusedWidth = focusedBorderWidth ?? kThickBorderWidth;

  final InputBorder effectiveInputBorder =
        borderType == CustomInputBorderType.underline
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(effectiveRadius),
                  topRight: Radius.circular(effectiveRadius),
                ),
              )
            : OutlineInputBorder(
                gapPadding: gapPadding,
                borderRadius: BorderRadius.all(
                  Radius.circular(effectiveRadius),
                ),
              );

  return InputDecorationTheme(
    labelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.error)) {
        if (states.contains(WidgetState.focused)) {
          return TextStyle(color: colorScheme.error);
        }
        if (states.contains(WidgetState.hovered)) {
          return TextStyle(color: colorScheme.onErrorContainer);
        }
        return TextStyle(color: colorScheme.error);
      }
      if (states.contains(WidgetState.focused)) {
        return TextStyle(color: baseColor);
      }
      if (states.contains(WidgetState.hovered)) {
        return TextStyle(color: colorScheme.onSurfaceVariant);
      }
      if (states.contains(WidgetState.disabled)) {
        return tintDisable
            ? TextStyle(color: tintDisabledColor)
            : TextStyle(color: colorScheme.onSurface.withAlpha(kAlphaDisabled));
      }
      return TextStyle(color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2);
    }),
    floatingLabelStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.error)) {
        if (states.contains(WidgetState.focused)) {
          return TextStyle(color: colorScheme.error);
        }

        if (states.contains(WidgetState.hovered)) {
          // TODO(rydmike): Info: M3 uses onErrorContainer.
          // TextStyle(color: colorScheme.onErrorContainer)
          // Excluding it, prefer error as float label color, FCS opinionated.
          return TextStyle(
            color: colorScheme.error.withAlpha(kEnabledBorderAlpha),
          );
        }
        return TextStyle(color: colorScheme.error);
      }
      if (states.contains(WidgetState.focused)) {
        return TextStyle(color: borderColor);
      }
      if (states.contains(WidgetState.hovered)) {
        return TextStyle(color: colorScheme.onSurfaceVariant);
      }
      if (states.contains(WidgetState.disabled)) {
        return tintDisable
            ? TextStyle(color: tintDisabledColor)
            : TextStyle(color: useM3 ? colorScheme.onSurface.withAlpha(kAlphaDisabled) : disabledColorM2);
      }
      return TextStyle(color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2);
    }),
    helperStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return tintDisable
            ? TextStyle(color: tintDisabledColor)
            : TextStyle(color: useM3 ? colorScheme.onSurface.withAlpha(kAlphaDisabled) : Colors.transparent);
      }
      return TextStyle(color: useM3 ? colorScheme.onSurfaceVariant : hintColorM2);
    }),
    hintStyle: WidgetStateTextStyle.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return TextStyle(color: tintDisable ? tintDisabledColor : disabledColorM2);
      }
      return TextStyle(color: hintColorM2);
    }),
    iconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return tintDisable ? tintDisabledColor : colorScheme.onSurface.withAlpha(kAlphaDisabled);
      }
      if (states.contains(WidgetState.focused)) {
        return useM3 ? colorScheme.onSurfaceVariant : baseColor;
      }
      return useM3 ? colorScheme.onSurfaceVariant : suffixIconColorM2;
    }),
    prefixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.disabled)) {
        return tintDisable ? tintDisabledColor : colorScheme.onSurface.withAlpha(kAlphaDisabled);
      }
      if (states.contains(WidgetState.focused)) {
        return prefixIconColor;
      }
      return useM3 ? colorScheme.onSurfaceVariant : suffixIconColorM2;
    }),
    suffixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.error)) {
        // TODO(rydmike): Info: M3 uses onErrorContainer.
        // if (states.contains(WidgetState.hovered)) {
        //   return colorScheme.onErrorContainer;
        // }
        // Excluding it, prefer suffix icon as error color, FCS opinionated.
        return colorScheme.error;
      }
      if (states.contains(WidgetState.disabled)) {
        return tintDisable ? tintDisabledColor : colorScheme.onSurface.withAlpha(kAlphaDisabled);
      }
      if (states.contains(WidgetState.focused)) {
        return useM3 ? colorScheme.onSurfaceVariant : baseColor;
      }
      return useM3 ? colorScheme.onSurfaceVariant : suffixIconColorM2;
    }),
    contentPadding: contentPadding,
    isDense: isDense ?? false,
    filled: filled ?? true,
    fillColor: usedFillColor,
    hoverColor: tintInteract ? tintedHover : null,
    focusedBorder: effectiveInputBorder.copyWith(
      borderSide: focusedHasBorder
          ? BorderSide(
              color: borderColor,
              width: focusedWidth,
            )
          : BorderSide.none,
    ),
    enabledBorder: effectiveInputBorder.copyWith(
      borderSide: unfocusedHasBorder
          ? BorderSide(
              color: enabledBorder,
              width: unfocusedWidth,
            )
          : BorderSide.none,
    ),
    disabledBorder: effectiveInputBorder.copyWith(
      borderSide: unfocusedHasBorder
          ? BorderSide(
              color: tintDisable
                  ? tintDisabledColor.withAlpha(kAlphaLowDisabled)
                  : borderType == CustomInputBorderType.underline
                      ? colorScheme.onSurface.withAlpha(kAlphaDisabled)
                      : colorScheme.onSurface.withAlpha(kAlphaVeryLowDisabled),
              width: unfocusedWidth,
            )
          : BorderSide.none,
    ),
    focusedErrorBorder: effectiveInputBorder.copyWith(
      borderSide: focusedHasBorder
          ? BorderSide(
              color: colorScheme.error,
              width: focusedWidth,
            )
          : BorderSide.none,
    ),
    errorBorder: effectiveInputBorder.copyWith(
        borderSide: focusedHasBorder
            ? BorderSide(
                color: colorScheme.error.withAlpha(useM3 ? 0xFF : kEnabledBorderAlpha),
                width: unfocusedWidth,
              )
            : BorderSide.none,),
  );
}
