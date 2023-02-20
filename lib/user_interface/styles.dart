// ignore_for_file: library_private_types_in_public_api
import 'package:sangjishik/core_packages.dart';

final $styles = AppStyle();

@immutable
class AppStyle {
  final AppColors colors = AppColors();
  late final _Insets insets = _Insets();
  final _Times times = _Times();
}

@immutable
class _Insets {
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
}

@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration slowest = const Duration(seconds: 2);
}
