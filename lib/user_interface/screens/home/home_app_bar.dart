import 'package:sangjishik/core_packages.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: $styles.colors.primary,
        title: Padding(
          padding: EdgeInsets.all($styles.insets.sm),
          child: Text('LOGO HERE'),
        ),
        actions: [],
      ),
    );
  }
}
