import 'package:flutter/material.dart';

enum FontFamily {
  eBGaramond('EBGaramond');

  const FontFamily(this.value);

  final String value;
}

class FontSizes {
  static const f10 = 10.0;
  static const f12 = 12.0;
  static const f14 = 14.0;
  static const f16 = 16.0;
  static const f18 = 18.0;
  static const f20 = 20.0;
  static const f24 = 24.0;
  static const f32 = 32.0;
  static const f40 = 40.0;
}

enum FontSize {
  s10(10.0),
  s12(12.0),
  s13(13.0),
  s14(14.0),
  s15(15.0),
  s16(16.0),
  s18(18.0),
  s20(20.0),
  s22(22.0),
  s24(24.0),
  s28(28.0),
  s32(32.0),
  s34(34.0),
  s40(40.0);

  const FontSize(this.value);

  final double value;
}

enum CustomFontWeight {
  bold(FontWeight.w700),
  regular(FontWeight.w400),
  medium(FontWeight.w500);

  const CustomFontWeight(this.value);

  final FontWeight value;

  FontWeight get fontWeight => value;
}

// Text style types based on the typography guide
enum TextStyleType {
  display2,
  display3,
  heading2,
  heading3,
  title,
  heading,
  body,
  caption,
  overline,
}

class AppFontStyle {
  const AppFontStyle(this.context);

  final BuildContext context;
  TextStyle? customNewFont({
    FontFamily fontFamily = FontFamily.eBGaramond,
    FontSize fontSize = FontSize.s14,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
    double? decorationThickness,
    TextOverflow? overFlow,
    double? height,
    double? letterSpacing,
    FontStyle? fontStyle,
    double? wordSpacing,
    TextBaseline? textBaseline,
    Color? backgroundColor,
  }) {
    return Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontFamily: fontFamily.value,
      fontSize: fontSize.value,
      fontWeight: fontWeight.fontWeight,
      color: color,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationThickness: decorationThickness ?? 2,
      overflow: overFlow ?? TextOverflow.ellipsis,
      height: height,
      letterSpacing: letterSpacing ?? 0,
      fontStyle: fontStyle,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      backgroundColor: backgroundColor,
    );
  }

  // Typography styles based on the specification

  // Display 2 - 40px with 48px height
  TextStyle? display2({
    FontFamily fontFamily = FontFamily.eBGaramond,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextOverflow? overFlow,
     FontSize? fontSize
  }) {
    return customNewFont(
      fontFamily: fontFamily,
      fontSize: fontSize ?? FontSize.s10,
      fontWeight: fontWeight,
      color: color,
      overFlow: overFlow,
      height: 48 / 40, // Height divided by fontSize, 
    );
  }

  // Display 3 - 32px with 40px height
  TextStyle? display3({
    FontFamily fontFamily = FontFamily.eBGaramond,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextOverflow? overFlow,
     FontSize? fontSize
  }) {
    return customNewFont(
      fontFamily: fontFamily,
      fontSize: fontSize ?? FontSize.s10,
      fontWeight: fontWeight,
      color: color,
      overFlow: overFlow,
      height: 40 / 32,
    );
  }

  // Heading 2 - 24px with 32px height
  TextStyle? heading2({
    FontFamily fontFamily = FontFamily.eBGaramond,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextOverflow? overFlow,
    FontSize? fontSize
  }) {
    return customNewFont(
      fontFamily: fontFamily,
      fontSize: fontSize ?? FontSize.s10,
      fontWeight: fontWeight,
      color: color,
      overFlow: overFlow,
      height: 32 / 24,
    );
  }

  // Heading 3 - 20px with 24px height
  TextStyle? heading3({
    FontFamily fontFamily = FontFamily.eBGaramond,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextOverflow? overFlow,
    FontSize? fontSize
  }) {
    return customNewFont(
      fontFamily: fontFamily,
      fontSize: fontSize ?? FontSize.s10,
      fontWeight: fontWeight,
      color: color,
      overFlow: overFlow,
      height: 24 / 20,
    );
  }

  // Title - 18px with 24px height
  TextStyle? title({
    FontFamily fontFamily = FontFamily.eBGaramond,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextOverflow? overFlow,
    FontSize? fontSize
  }) {
    return customNewFont(
      fontFamily: fontFamily,
      fontSize: fontSize ?? FontSize.s10, 
      fontWeight: fontWeight,
      color: color,
      overFlow: overFlow,
      height: 24 / 18,
    );
  }

  // Heading - 16px with 24px height
  TextStyle? heading({
    FontFamily fontFamily = FontFamily.eBGaramond,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextOverflow? overFlow,
      FontSize? fontSize
  }) {
    return customNewFont(
      fontFamily: fontFamily,
      fontSize: fontSize ?? FontSize.s10,
      fontWeight: fontWeight,
      color: color,
      overFlow: overFlow,
      height: 24 / 16,
    );
  }

  // Body - 14px with 16px height
  TextStyle? body({
    FontFamily fontFamily = FontFamily.eBGaramond,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextOverflow? overFlow,
    FontSize? fontSize
  }) {
    return customNewFont(
      fontFamily: fontFamily,
      fontSize: fontSize ?? FontSize.s10,
      fontWeight: fontWeight,
      color: color,
      overFlow: overFlow,
      height: 16 / 14,
    );
  }

  // Caption - 12px with 16px height
  TextStyle? caption({
    FontFamily fontFamily = FontFamily.eBGaramond,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextOverflow? overFlow,
    FontSize? fontSize
  }) {
    return customNewFont(
      fontFamily: fontFamily,
      fontSize: fontSize ?? FontSize.s10,
      fontWeight: fontWeight,
      color: color,
      overFlow: overFlow,
      height: 16 / 12,
    );
  }

  // Overline - 10px with 12px height
  TextStyle? overline({
    FontFamily fontFamily = FontFamily.eBGaramond,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextOverflow? overFlow,
    FontSize? fontSize
  }) {
    return customNewFont(
      fontFamily: fontFamily,
      fontSize: fontSize ?? FontSize.s10,
      fontWeight: fontWeight,
      color: color,
      overFlow: overFlow,
      height: 12 / 10,
    );
  }

  // Helper method to get style by type
  TextStyle? getStyleByType({
    required TextStyleType type,
    FontFamily fontFamily = FontFamily.eBGaramond,
    CustomFontWeight fontWeight = CustomFontWeight.regular,
    Color? color,
    TextOverflow? overFlow,
  }) {
    switch (type) {
      case TextStyleType.display2:
        return display2(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          overFlow: overFlow,
        );
      case TextStyleType.display3:
        return display3(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          overFlow: overFlow,
        );
      case TextStyleType.heading2:
        return heading2(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          overFlow: overFlow,
        );
      case TextStyleType.heading3:
        return heading3(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          overFlow: overFlow,
        );
      case TextStyleType.title:
        return title(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          overFlow: overFlow,
        );
      case TextStyleType.heading:
        return heading(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          overFlow: overFlow,
        );
      case TextStyleType.body:
        return body(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          overFlow: overFlow,
        );
      case TextStyleType.caption:
        return caption(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          overFlow: overFlow,
        );
      case TextStyleType.overline:
        return overline(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color,
          overFlow: overFlow,
        );
    }
  }
}

// Extension for easy context access
extension ContextLocaleExtension on BuildContext {
  AppFontStyle get appFonts => AppFontStyle(this);
}
