// ignore_for_file: library_private_types_in_public_api
import 'package:sangjishik/core_packages.dart';
import 'package:google_fonts/google_fonts.dart';

final $styles = AppStyle();

@immutable
class AppStyle {
  AppStyle({Size? screenSize}) {
    if (screenSize == null) {
      scale = 1;
      return;
    }
    final shortestSide = screenSize.shortestSide;
    const tabletXl = 1000;
    const tabletLg = 800;
    const tabletSm = 600;
    const phoneLg = 400;
    if (shortestSide > tabletXl) {
      scale = 1.25;
    } else if (shortestSide > tabletLg) {
      scale = 1.15;
    } else if (shortestSide > tabletSm) {
      scale = 1;
    } else if (shortestSide > phoneLg) {
      scale = .9; // phone
    } else {
      scale = .85; // small phone
    }
  }

  late final double scale;

  /// The current theme colors for the app
  final AppColors colors = AppColors();

  /// Text styles
  late final _Text text = _Text(scale);

  /// Padding and margin values
  late final _Insets insets = _Insets(scale);

  /// Animation Durations
  final _Times times = _Times();
}

@immutable
class _Text {
  _Text(this._scale);

  final double _scale;

  late final TextStyle h1 =
      _createFont(GoogleFonts.lora(), sizePx: 64, heightPx: 64);
  late final TextStyle h2 =
      _createFont(GoogleFonts.lora(), sizePx: 32, heightPx: 46);
  late final TextStyle h3 = _createFont(GoogleFonts.lora(),
      sizePx: 24, heightPx: 36, weight: FontWeight.w600);
  late final TextStyle h4 = _createFont(GoogleFonts.lora(),
      sizePx: 14,
      heightPx: 23,
      spacingPc: 5,
      weight: FontWeight.w600,
      color: $styles.colors.background);

  late final TextStyle title1 =
      _createFont(GoogleFonts.roboto(), sizePx: 16, heightPx: 26, spacingPc: 5);

  late final TextStyle body = _createFont(GoogleFonts.roboto(),
      sizePx: 16, heightPx: 26, color: Colors.black);
  late final TextStyle bodyBold = _createFont(GoogleFonts.roboto(),
      sizePx: 16, heightPx: 26, weight: FontWeight.w600);
  late final TextStyle bodySmall = _createFont(GoogleFonts.roboto(),
      sizePx: 12, heightPx: 23, color: Colors.black);
  late final TextStyle bodySmallBold = _createFont(GoogleFonts.roboto(),
      sizePx: 14, heightPx: 23, weight: FontWeight.w600);

  late final TextStyle caption = _createFont(GoogleFonts.roboto(),
          sizePx: 14, heightPx: 20, weight: FontWeight.w500)
      .copyWith(fontStyle: FontStyle.italic);

  late final TextStyle btn = _createFont(GoogleFonts.roboto(),
      sizePx: 14,
      weight: FontWeight.w500,
      spacingPc: 2,
      heightPx: 14,
      color: $styles.colors.background);

  TextStyle _createFont(TextStyle style,
      {required double sizePx,
      double? heightPx,
      double? spacingPc,
      FontWeight? weight,
      Color? color}) {
    sizePx *= _scale;
    if (heightPx != null) {
      heightPx *= _scale;
    }
    return style.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : style.height,
        letterSpacing:
            spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
        fontWeight: weight,
        color: color);
  }
}

@immutable
class _Insets {
  _Insets(this._scale);

  final double _scale;

  late final double xxs = 4 * _scale;
  late final double xs = 8 * _scale;
  late final double sm = 16 * _scale;
  late final double md = 24 * _scale;
  late final double lg = 32 * _scale;
  late final double xl = 48 * _scale;
  late final double xxl = 56 * _scale;
  late final double offset = 80 * _scale;
}

@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration map = const Duration(seconds: 4);
  final Duration refresh = const Duration(seconds: 30);
  final Duration check = const Duration(minutes: 5);
}
