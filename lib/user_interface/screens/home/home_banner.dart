import 'package:sangjishik/core_packages.dart';

class HomeBanner extends StatelessWidget {
  final bool isSmallScreen;
  final bool isNightTime;
  final double height;
  final double width;

  const HomeBanner(
      {Key? key,
      required this.isSmallScreen,
      required this.isNightTime,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //TODO: Use Random R seed to generate image from list
    String getBackground() {
      return 'https://images.pexels.com/photos/13611178/pexels-photo-13611178.jpeg?auto=compress&cs=tinysrgb&w=1200&lazy=load';
    }

    //FIXME: Add padding to give a "boxed" feeling
    //TODO: Add scroll down button
    //TODO: Add logo to the center or white text
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: height,
        width: width,
        child: Image.network(getBackground()),
      ),
    );
  }
}
