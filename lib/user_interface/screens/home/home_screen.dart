import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/about/about_screen.dart';
import 'package:sangjishik/user_interface/screens/contact/contact_screen.dart';
import 'package:sangjishik/user_interface/screens/home/home_app_bar.dart';
import 'package:sangjishik/user_interface/screens/home/front_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _controller;
  final ValueNotifier<bool> seenHomeBanner = ValueNotifier<bool>(false);
  late double screenHeight;

  int _index = 0;

  List<Widget> screens = [
    FrontScreen(),
    AboutScreen(),
    ContactMeScreen(),
  ];

  //FIXME: This does this weird bouncing thing...
  void _onScrollPosition() {
    _controller.animateTo(screenHeight - 1,
        duration: $styles.times.fast, curve: Curves.ease);
  }

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void openDrawer() {
    print('No drawer yet');
  }

  void navigateScreen(int index) {
    //FIXME: Maybe instead of navigating, push to new page? That way, people can click the back button on mobile?
    _index = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = context.heightPx;
    double width = context.widthPx;

    screenHeight = height;

    bool isSmallScreen = context.widthPx < 700;
    DateTime currentDate = DateTime.now();
    bool isNightTime = currentDate.hour >= 17;

    bool removeHomeBanner(double offset) {
      if (offset >= height) {
        seenHomeBanner.value = true;
        return true;
      }

      return false;
    }

    return NotificationListener(
      onNotification: (t) => removeHomeBanner(_controller.offset),
      child: ListView(
        controller: _controller,
        children: [
          Stack(
            children: [
              SizedBox(
                height: height,
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 0,
                      child: HomeAppBar(
                          isSmallScreen: isSmallScreen,
                          onTap: navigateScreen,
                          onDrawerTap: openDrawer),
                    ),

                    //FIXME: Everything below this is the "body" of the blog
                    Padding(
                      padding: EdgeInsets.only(top: 65),
                      child: screens.elementAt(_index),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: FloatingActionButton(
                        onPressed: () => print('BLOG!'),
                        child: Icon(Icons.add),
                      ),
                    ),
                  ],
                ),
              ),
              // StyledNavigation(height: height, width: width),
            ],
          ),
        ],
      ),
    );
  }
}
