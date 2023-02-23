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
  final ValueNotifier<bool> seenHomeBanner = ValueNotifier<bool>(false);
  late double screenHeight;

  String quote = '';
  String author = '';

  void _onScrollPosition() {
    _controller.animateTo(screenHeight,
        duration: $styles.times.fast, curve: Curves.ease);
  }

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
    // quote = list[10]['quote'];
    // author = list[10]['author'];
  }

  @override
  Widget build(BuildContext context) {
    double height = context.heightPx;
    double width = context.widthPx;

    screenHeight = height;

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

    bool removeHomeBanner(double offset) {
      if (offset == height) {
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
          _buildHomeBanner(getBackground, height, width),
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
                        child: SizedBox(
                          width: isSmallScreen ? width / 1.5 : width / 2,
                          child: Column(
                            children: [
                              VSpace.med,
                              QuoteText(text: '"$quote"'),
                              VSpace.med,
                              AuthorText(text: '- $author'),
                            ],
                          ),
                        ),
                      ),
                      VSpace.xl,
                      HomePostButtons(isSmallScreen: isSmallScreen),
                      VSpace.med,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32),
                        child: Container(
                          color: Colors.blueAccent,
                          width: width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('TEST'),
                              Text('TEST'),
                              Text('TEST'),
                            ],
                          ),
                        ),
                      )
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

  ValueListenableBuilder<bool> _buildHomeBanner(
      String Function() getBackground, double height, double width) {
    return ValueListenableBuilder<bool>(
      valueListenable: seenHomeBanner,
      builder: (BuildContext context, bool value, _) {
        return value
            ? Container()
            : HomeBanner(
                background: getBackground(),
                height: height,
                width: width,
                onTap: _onScrollPosition,
              );
      },
    );
  }
}
