import 'package:sangjishik/core_packages.dart';

class HomeAppBar extends StatelessWidget {
  final bool isSmallScreen;
  final VoidCallback onTap;

  const HomeAppBar({Key? key, required this.isSmallScreen, required this.onTap})
      : super(key: key);

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              //TODO: Change this to animatedIcon?
              child: IconButton(
                  splashRadius: 1, onPressed: onTap, icon: Icon(Icons.menu)),
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
