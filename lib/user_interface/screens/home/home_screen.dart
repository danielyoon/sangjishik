import 'dart:math';

import 'package:sangjishik/business_logic/data/quotes.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/home/home_app_bar.dart';
import 'package:sangjishik/user_interface/screens/home/quoted_text.dart';
import 'package:sized_context/sized_context.dart';
import 'package:sangjishik/user_interface/screens/home/home_banner.dart';
import 'package:sangjishik/business_logic/data/backgrounds.dart';
import 'package:sangjishik/user_interface/screens/home/home_post_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _controller;
  bool seenHomeBanner = false;

  String quote = '';
  String author = '';

  void _onScrollPosition() {}

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    getQuote();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void getQuote() {
    Map<int, dynamic> list = quotes;
    final random = Random();

    var i = random.nextInt(list.length);

    quote = list[i]['quote'];
    author = list[i]['author'];
  }

  @override
  Widget build(BuildContext context) {
    double height = context.heightPx;
    double width = context.widthPx;

    bool isSmallScreen = context.widthPx < 700;
    DateTime currentDate = DateTime.now();
    bool isNightTime = currentDate.hour >= 17;

    String getBackground() {
      List<String> list = [];
      final random = Random();

      if (isNightTime && isSmallScreen) list = nightPortrait;
      if (isNightTime && !isSmallScreen) list = nightLandscape;
      if (!isNightTime && isSmallScreen) list = lightPortrait;
      if (!isNightTime && !isSmallScreen) list = lightLandscape;

      var i = random.nextInt(list.length);

      return list[i];
    }

    void scrollToContent() {}

    bool removeHomeBanner(double offset) {
      print(offset);
      if (offset > 925) {
        setState(() {
          seenHomeBanner = true;
        });
        return true;
      }

      return false;
    }

    return NotificationListener(
      onNotification: (t) => removeHomeBanner(_controller.offset),
      child: ListView(
        controller: _controller,
        children: [
          ValueListenableBuilder(
              valueListenable: valueListenable, builder: builder),
          seenHomeBanner
              ? Container()
              : HomeBanner(
                  background: getBackground(),
                  height: height,
                  width: width,
                  onTap: _onScrollPosition,
                ),
          SizedBox(
            height: height,
            child: Stack(
              children: [
                Positioned.fill(
                    top: 0, child: HomeAppBar(isSmallScreen: isSmallScreen)),
                Padding(
                  padding: const EdgeInsets.only(top: 65),
                  child: ListView(
                    physics: PageScrollPhysics(),
                    children: [
                      Center(
                        child: Column(
                          children: const [
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                            Text('TEST'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildHomeAppBar(bool isSmallScreen) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blue,
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
    );
  }
}

// seenHomeBanner
// ? Container()
//     : HomeBanner(
// background: getBackground(),
// height: height,
// width: width,
// onTap: _onScrollPosition,
// ),

// Column(
// children: [
// Column(
// children: [
// VSpace.med,
// QuoteText(text: '"$quote"'),
// VSpace.med,
// AuthorText(text: '- $author'),
// ],
// ),
// ],
// ),
