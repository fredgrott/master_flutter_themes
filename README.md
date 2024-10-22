![image header](./media/image-header.png)

# Master Flutter Themes

So quite a few changes between flutter 2.0 and flutter 3.0 and this repo covers the changes in the themes, component themes, color space and color schemes, etc.

While we no longer have to manually implement each component theme; there are some tricks to get it implemented in a design
impactful way. Included in the full solutions folder is the way to handle theme adaptations per device platforms.

And, of course, why not show how to store user preferences such as the ThemeMode via shared preferences or hive?

So what do I cover beyond the SDK docs?
- Visual Density Screen Size Fix
- Brand Color Inclusion Back Into HCT
- Way To Use All 3 Brand Colors as Seeds
- Dynamic Color tweaks
- ViewModel data binding example(Color Scheme is a ViewModel)

## Packages Used

Packages used are:

[Material Color Utilities-from Flutter Team](https://pub.dev/packages/material_color_utilities)


[Dynamic Color-from Flutter Team](https://pub.dev/packages/dynamic_color)


[Flex Seed Scheme-from RydMike](https://pub.dev/packages/flex_seed_scheme)


[Flex Color Scheme-from RydMike](https://pub.dev/packages/flex_color_scheme)


[Google Fonts-from Google team](https://pub.dev/packages/google_fonts)


[Universal Platform=-from GSkinner](https://pub.dev/packages/universal_platform)

[Shared Preferences](https://pub.dev/packages/shared_preferences)

[Hive](https://pub.dev/packages/hive)


## Articles Can Be Found At

Articles can be found at my substack on Flutter:

[Fred Grott's Substack On Flutter](https://fredgrott.substack.com)

## Credits

Credit goes to GSkinner, RydMike, Google and the Flutter SDK team.

## License

BSD-3 clause license