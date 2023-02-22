import 'package:sangjishik/core_packages.dart';

class HomeAppBar extends StatelessWidget {
  final bool isSmallScreen;

  const HomeAppBar({Key? key, required this.isSmallScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: true,
        leading: !isSmallScreen ? Center(child: Text('LOGO')) : Container(),
        title: isSmallScreen ? Text('LOGO') : Container(),
        actions: [
          if (isSmallScreen == true)
            //FIXME: Add open drawer screen!
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  splashRadius: 1,
                  onPressed: () => print('TEST'),
                  icon: Icon(Icons.menu)),
            )
          else
            //FIXME: Should fix this to make it presentable...
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
