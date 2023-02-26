import 'package:sangjishik/core_packages.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: $styles.insets.xxl * 3),
      children: [
        VSpace.xl,
        Text('ABOUT'),
        Text('Who'),
        Text('Hi! My name is Daniel Yoon.'),
        VSpace.med,
        Text('What'),
        Text('Hi! My name is Daniel Yoon.'),
        VSpace.med,
        Text('When'),
        Text('Hi! My name is Daniel Yoon.'),
        VSpace.med,
        Text('Where'),
        Text('Hi! My name is Daniel Yoon.'),
        VSpace.med,
        Text('Why'),
        Text('Hi! My name is Daniel Yoon.'),
        VSpace.med,
      ],
    );
  }
}
