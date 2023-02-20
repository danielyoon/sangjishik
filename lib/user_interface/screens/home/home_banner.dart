import 'package:sangjishik/core_packages.dart';

class HomeBanner extends StatelessWidget {
  final bool isSmallScreen;
  final bool isNightTime;

  const HomeBanner(
      {Key? key, required this.isSmallScreen, required this.isNightTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String getBackground() {
      return 'Hello!';
    }

    // Set height and width so it can be scrolled
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(getBackground()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
