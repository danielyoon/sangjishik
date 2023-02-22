import 'package:sangjishik/core_packages.dart';

class HomePostButtons extends StatelessWidget {
  final bool isSmallScreen;

  const HomePostButtons({Key? key, required this.isSmallScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isSmallScreen
          ? Text('Latest Post')
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Latest'),
                Text('Laugh'),
                Text('Learn'),
                Text('Landom'),
              ],
            ),
    );
  }
}
