# flex_seed_scheme_demo

Flutter SDK standardizes how Material Design HCT color space is applied whereas Flex Seed Scheme package allows to us to design wise fine-tune the expression of HCT color space in our themes.

First step is to implement using Flex Seed Scheme in the raw. Then to use that create a state manageed dynamic color theme 
set up with hive storage. This is the step before that step.

The bit of engineering knowledge comes in where to do the 
translation of different methods of computing the ColorScheme and Themes. I.E. either FSS and FCS way to the Flutter SDK and
dynamic color package ways. My solution is to take the stuff 
generated via the dynamic color and re-use it generate seeds
for use in FSS and FCS ways of generating the ColorScheme, Themes, etc.

This way I can get away without having to massively change the dynamic color and dynamik themes packages. Takes a bit of creative boilerplate but far less than massivelying customizing those packages.


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
