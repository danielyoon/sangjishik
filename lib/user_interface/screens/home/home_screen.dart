import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/home/home_app_bar.dart';
import 'package:sized_context/sized_context.dart';
import 'package:sangjishik/user_interface/screens/home/home_banner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = context.heightPx;
    double width = context.widthPx;

    //TODO: Should put layout builder to re-render correctly
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeBanner(
              isSmallScreen: false,
              isNightTime: false,
              height: height,
              width: width),
          HomeAppBar(isMobile: true),
        ],
      ),
    );
  }
}
