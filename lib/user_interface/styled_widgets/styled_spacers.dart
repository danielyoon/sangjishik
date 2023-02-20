import 'package:sangjishik/core_packages.dart';

class VSpace extends StatelessWidget {
  final double size;

  const VSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(height: size);

  static VSpace get xs => VSpace($styles.insets.xs);
  static VSpace get sm => VSpace($styles.insets.sm);
  static VSpace get med => VSpace($styles.insets.md);
  static VSpace get lg => VSpace($styles.insets.lg);
  static VSpace get xl => VSpace($styles.insets.xl);
}

class HSpace extends StatelessWidget {
  final double size;

  const HSpace(this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(width: size);

  static HSpace get xs => HSpace($styles.insets.xs);
  static HSpace get sm => HSpace($styles.insets.sm);
  static HSpace get med => HSpace($styles.insets.md);
  static HSpace get lg => HSpace($styles.insets.lg);
  static HSpace get xl => HSpace($styles.insets.xl);
}
