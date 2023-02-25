import 'package:sangjishik/core_packages.dart';

class HomeAppBar extends StatelessWidget {
  final bool isSmallScreen;
  final VoidCallback onDrawerTap;
  final Function(int) onTap;

  const HomeAppBar(
      {Key? key,
      required this.isSmallScreen,
      required this.onDrawerTap,
      required this.onTap})
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
                  splashRadius: 1,
                  onPressed: onDrawerTap,
                  icon: Icon(Icons.menu)),
            )
          else
            //FIXME: Should fix this to make it presentable...
            Row(
              children: [
                StyledTextButton(onPressed: () => onTap(1), text: 'About'),
                StyledTextButton(onPressed: () => onTap(2), text: 'Blogs'),
                StyledTextButton(
                    onPressed: () => onTap(3), text: 'Get In Touch'),
                //FIXME: This should open a popup banner
                StyledTextButton(onPressed: () => onTap(0), text: 'Login'),
              ],
            ),
        ],
      ),
    );
  }
}
