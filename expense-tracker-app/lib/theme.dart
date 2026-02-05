import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5b5891),
      surfaceTint: Color(0xff5b5891),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe3dfff),
      onPrimaryContainer: Color(0xff434078),
      secondary: Color(0xff5e5c71),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe3e0f9),
      onSecondaryContainer: Color(0xff464559),
      tertiary: Color(0xff7a5367),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd8ea),
      onTertiaryContainer: Color(0xff603b4f),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff1c1b21),
      onSurfaceVariant: Color(0xff47464f),
      outline: Color(0xff787680),
      outlineVariant: Color(0xffc8c5d0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313036),
      inversePrimary: Color(0xffc4c0ff),
      primaryFixed: Color(0xffe3dfff),
      onPrimaryFixed: Color(0xff17134a),
      primaryFixedDim: Color(0xffc4c0ff),
      onPrimaryFixedVariant: Color(0xff434078),
      secondaryFixed: Color(0xffe3e0f9),
      onSecondaryFixed: Color(0xff1a1a2c),
      secondaryFixedDim: Color(0xffc7c4dc),
      onSecondaryFixedVariant: Color(0xff464559),
      tertiaryFixed: Color(0xffffd8ea),
      onTertiaryFixed: Color(0xff2f1123),
      tertiaryFixedDim: Color(0xffeab9d1),
      onTertiaryFixedVariant: Color(0xff603b4f),
      surfaceDim: Color(0xffdcd8e0),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xfff0ecf4),
      surfaceContainerHigh: Color(0xffebe7ef),
      surfaceContainerHighest: Color(0xffe5e1e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff322f66),
      surfaceTint: Color(0xff5b5891),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff6a67a1),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff353448),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6d6b81),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4e2b3e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff8a6176),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff111116),
      onSurfaceVariant: Color(0xff36353e),
      outline: Color(0xff53515a),
      outlineVariant: Color(0xff6e6c75),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313036),
      inversePrimary: Color(0xffc4c0ff),
      primaryFixed: Color(0xff6a67a1),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff514e87),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6d6b81),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff545367),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff8a6176),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff70495e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc8c5cd),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff6f2fa),
      surfaceContainer: Color(0xffebe7ef),
      surfaceContainerHigh: Color(0xffdfdbe3),
      surfaceContainerHighest: Color(0xffd4d0d8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff28255b),
      surfaceTint: Color(0xff5b5891),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff45437a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2b2a3d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff48475b),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff422134),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff633e52),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffcf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2c2b33),
      outlineVariant: Color(0xff494851),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313036),
      inversePrimary: Color(0xffc4c0ff),
      primaryFixed: Color(0xff45437a),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2f2c62),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff48475b),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff323144),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff633e52),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff4a283b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb7bf),
      surfaceBright: Color(0xfffcf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3eff7),
      surfaceContainer: Color(0xffe5e1e9),
      surfaceContainerHigh: Color(0xffd7d3db),
      surfaceContainerHighest: Color(0xffc8c5cd),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffc4c0ff),
      surfaceTint: Color(0xffc4c0ff),
      onPrimary: Color(0xff2c2960),
      primaryContainer: Color(0xff434078),
      onPrimaryContainer: Color(0xffe3dfff),
      secondary: Color(0xffc7c4dc),
      onSecondary: Color(0xff302e42),
      secondaryContainer: Color(0xff464559),
      onSecondaryContainer: Color(0xffe3e0f9),
      tertiary: Color(0xffeab9d1),
      onTertiary: Color(0xff472638),
      tertiaryContainer: Color(0xff603b4f),
      onTertiaryContainer: Color(0xffffd8ea),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff131318),
      onSurface: Color(0xffe5e1e9),
      onSurfaceVariant: Color(0xffc8c5d0),
      outline: Color(0xff928f99),
      outlineVariant: Color(0xff47464f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inversePrimary: Color(0xff5b5891),
      primaryFixed: Color(0xffe3dfff),
      onPrimaryFixed: Color(0xff17134a),
      primaryFixedDim: Color(0xffc4c0ff),
      onPrimaryFixedVariant: Color(0xff434078),
      secondaryFixed: Color(0xffe3e0f9),
      onSecondaryFixed: Color(0xff1a1a2c),
      secondaryFixedDim: Color(0xffc7c4dc),
      onSecondaryFixedVariant: Color(0xff464559),
      tertiaryFixed: Color(0xffffd8ea),
      onTertiaryFixed: Color(0xff2f1123),
      tertiaryFixedDim: Color(0xffeab9d1),
      onTertiaryFixedVariant: Color(0xff603b4f),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff39383f),
      surfaceContainerLowest: Color(0xff0e0e13),
      surfaceContainerLow: Color(0xff1c1b21),
      surfaceContainer: Color(0xff201f25),
      surfaceContainerHigh: Color(0xff2a292f),
      surfaceContainerHighest: Color(0xff35343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffdcd8ff),
      surfaceTint: Color(0xffc4c0ff),
      onPrimary: Color(0xff211e54),
      primaryContainer: Color(0xff8d8ac7),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffddd9f3),
      onSecondary: Color(0xff252436),
      secondaryContainer: Color(0xff918ea5),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffcfe6),
      onTertiary: Color(0xff3b1b2d),
      tertiaryContainer: Color(0xffb1849a),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff131318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffdedbe6),
      outline: Color(0xffb3b0bb),
      outlineVariant: Color(0xff918f99),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inversePrimary: Color(0xff444179),
      primaryFixed: Color(0xffe3dfff),
      onPrimaryFixed: Color(0xff0c0540),
      primaryFixedDim: Color(0xffc4c0ff),
      onPrimaryFixedVariant: Color(0xff322f66),
      secondaryFixed: Color(0xffe3e0f9),
      onSecondaryFixed: Color(0xff100f21),
      secondaryFixedDim: Color(0xffc7c4dc),
      onSecondaryFixedVariant: Color(0xff353448),
      tertiaryFixed: Color(0xffffd8ea),
      onTertiaryFixed: Color(0xff230718),
      tertiaryFixedDim: Color(0xffeab9d1),
      onTertiaryFixedVariant: Color(0xff4e2b3e),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff45444a),
      surfaceContainerLowest: Color(0xff07070c),
      surfaceContainerLow: Color(0xff1e1d23),
      surfaceContainer: Color(0xff28272d),
      surfaceContainerHigh: Color(0xff333238),
      surfaceContainerHighest: Color(0xff3e3d43),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff2eeff),
      surfaceTint: Color(0xffc4c0ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc0bcfd),
      onPrimaryContainer: Color(0xff06003a),
      secondary: Color(0xfff2eeff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc3c0d9),
      onSecondaryContainer: Color(0xff0a091b),
      tertiary: Color(0xffffebf2),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffe6b5cd),
      onTertiaryContainer: Color(0xff1c0312),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff131318),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff2eefa),
      outlineVariant: Color(0xffc4c1cc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e1e9),
      inversePrimary: Color(0xff444179),
      primaryFixed: Color(0xffe3dfff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffc4c0ff),
      onPrimaryFixedVariant: Color(0xff0c0540),
      secondaryFixed: Color(0xffe3e0f9),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc7c4dc),
      onSecondaryFixedVariant: Color(0xff100f21),
      tertiaryFixed: Color(0xffffd8ea),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffeab9d1),
      onTertiaryFixedVariant: Color(0xff230718),
      surfaceDim: Color(0xff131318),
      surfaceBright: Color(0xff514f56),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff201f25),
      surfaceContainer: Color(0xff313036),
      surfaceContainerHigh: Color(0xff3c3b41),
      surfaceContainerHighest: Color(0xff47464c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
