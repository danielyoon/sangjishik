import 'package:sangjishik/core_packages.dart';

class HomeAppBar extends StatelessWidget {
  final bool isMobile;

  const HomeAppBar({Key? key, required this.isMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      //FIXME: Make a correctly sized container for app bar
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: !isMobile ? Text('LOGO') : Container(),
        title: isMobile ? Text('LOGO') : Container(),
        actions: [
          if (isMobile == true)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  splashRadius: 1,
                  onPressed: () => print('TEST'),
                  icon: Icon(Icons.menu)),
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('About'),
                Text('Blogs'),
                Text('Get In Touch'),
                Text('Login'),
              ],
            ),
        ],
      ),
    );
  }
}
