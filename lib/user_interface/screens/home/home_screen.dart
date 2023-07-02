import 'dart:math';

import 'package:sangjishik/business_logic/data/quotes.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/home/home_app_bar.dart';
import 'package:sangjishik/user_interface/screens/posts/posts_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late dynamic qotd;

  @override
  void initState() {
    super.initState();

    qotd = getQuote();
  }

  dynamic getQuote() {
    int randomIndex = Random().nextInt(quotes.length);

    return quotes[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(),
        VSpace.xl,
        _quotesWidget(width),
        VSpace.xl,
        PostsScreen(),
      ],
    );
  }

  Padding _quotesWidget(double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.lg),
      child: SizedBox(
        width: (width > 780) ? width / 3 : width / 1.2,
        child: Text(
          qotd['quote'] + '\n\n      -  ' + qotd['author'],
          style: $styles.text.caption,
          softWrap: true,
        ),
      ),
    );
  }
}
