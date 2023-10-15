import 'package:flutter/foundation.dart';
import 'package:sangjishik/core_packages.dart';

class DevicePlatform {
  static const _desktopPlatforms = [
    TargetPlatform.macOS,
    TargetPlatform.windows,
    TargetPlatform.linux
  ];
  static const _mobilePlatforms = [TargetPlatform.android, TargetPlatform.iOS];

  static bool get isDesktop =>
      _desktopPlatforms.contains(defaultTargetPlatform) && !kIsWeb;
  static bool get isDesktopOrWeb => isDesktop || kIsWeb;
  static bool get isMobile =>
      _mobilePlatforms.contains(defaultTargetPlatform) && !kIsWeb;

  static double get pixelRatio =>
      WidgetsBinding.instance.window.devicePixelRatio;

  static bool get isWindows => defaultTargetPlatform == TargetPlatform.windows;
  static bool get isLinux => defaultTargetPlatform == TargetPlatform.linux;
  static bool get isMacOS => defaultTargetPlatform == TargetPlatform.macOS;
  static bool get isAndroid => defaultTargetPlatform == TargetPlatform.android;
  static bool get isIOS => defaultTargetPlatform == TargetPlatform.iOS;
}

enum FormFactorType { Monitor, SmallPhone, LargePhone, Tablet }

class DeviceScreen {
  // Get the device form factor as best we can.
  // Otherwise we will use the screen size to determine which class we fall into.
  static FormFactorType get(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide;
    if (shortestSide <= 300) return FormFactorType.SmallPhone;
    if (shortestSide <= 600) return FormFactorType.LargePhone;
    if (shortestSide <= 900) return FormFactorType.Tablet;
    return FormFactorType.Monitor;
  }

  // Shortcuts for various mobile device types
  static bool isPhone(BuildContext context) =>
      isSmallPhone(context) || isLargePhone(context);
  static bool isTablet(BuildContext context) =>
      get(context) == FormFactorType.Tablet;
  static bool isMonitor(BuildContext context) =>
      get(context) == FormFactorType.Monitor;
  static bool isSmallPhone(BuildContext context) =>
      get(context) == FormFactorType.SmallPhone;
  static bool isLargePhone(BuildContext context) =>
      get(context) == FormFactorType.LargePhone;
}
