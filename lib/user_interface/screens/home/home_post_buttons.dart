import 'package:sangjishik/core_packages.dart';

class HomePostButtons extends StatelessWidget {
  final bool isMobile;

  const HomePostButtons({Key? key, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isMobile
        ? Text('Latest Post')
        : ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('TEST'),
                Text('TEST2'),
                Text('TEST3'),
                Text('TEST4'),
              ],
            ),
          );
  }
}
