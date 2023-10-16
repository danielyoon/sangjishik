import 'package:sangjishik/core_packages.dart';

class VSpace extends StatelessWidget {
  final double size;

  const VSpace({super.key, required this.size});

  @override
  Widget build(BuildContext context) => SizedBox(height: size);

  static VSpace get xxs => VSpace(size: kExtraExtraSmall);
  static VSpace get xs => VSpace(size: kExtraSmall);
  static VSpace get sm => VSpace(size: kSmall);
  static VSpace get md => VSpace(size: kMedium);
  static VSpace get lg => VSpace(size: kLarge);
  static VSpace get xl => VSpace(size: kExtraLarge);
  static VSpace get xxl => VSpace(size: kExtraExtraLarge);
}

class HSpace extends StatelessWidget {
  final double size;

  const HSpace({super.key, required this.size});

  @override
  Widget build(BuildContext context) => SizedBox(width: size);

  static HSpace get xxs => HSpace(size: kExtraExtraSmall);
  static HSpace get xs => HSpace(size: kExtraSmall);
  static HSpace get sm => HSpace(size: kSmall);
  static HSpace get md => HSpace(size: kMedium);
  static HSpace get lg => HSpace(size: kLarge);
  static HSpace get xl => HSpace(size: kExtraLarge);
  static HSpace get xxl => HSpace(size: kExtraExtraLarge);
}
