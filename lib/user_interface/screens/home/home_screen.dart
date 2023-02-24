import 'dart:math';

import 'package:sangjishik/business_logic/data/quotes.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/contact/contact_screen.dart';
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

  int _index = 0;

  String quote = '';
  String author = '';

  void _onScrollPosition() {
    _controller.animateTo(screenHeight - 50,
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
  }

  void openDrawer() {
    print('No drawer yet');
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
      if (offset >= height) {
        seenHomeBanner.value = true;
        return true;
      }

      return false;
    }

    List<Row> rowOfPosts = [];

    return NotificationListener(
      onNotification: (t) => removeHomeBanner(_controller.offset),
      child: ListView(
        controller: _controller,
        children: [
          _buildHomeBanner(getBackground, height, width),
          Stack(
            children: [
              SizedBox(
                height: height,
                child: Stack(
                  children: [
                    Positioned.fill(
                      top: 0,
                      child: HomeAppBar(
                          isSmallScreen: isSmallScreen, onTap: openDrawer),
                    ),
                    //FIXME: Everything below this is the "body" of the blog
                    Padding(
                      padding: const EdgeInsets.only(top: 65),
                      child: SingleChildScrollView(
                        child: Column(
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
                            StyledPosts(
                                post1: 'POST1', post2: 'POST2', post3: null),
                            VSpace.med,
                            ...rowOfPosts,
                            ElevatedButton(
                              onPressed: () => print('TEST'),
                              child: Text('LOAD MORE'),
                            ),
                            ContactMeScreen(),
                          ],
                        ),
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
