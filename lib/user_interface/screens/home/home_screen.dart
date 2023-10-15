import 'dart:math';

import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/posts/posts_screen.dart';
import 'package:sangjishik/controller/data/quotes.dart';

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
    double height = context.heightPx;
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all((Colors.transparent))),
      ),
      child: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VSpace.med,
              _quotesWidget(width),
              VSpace.xl,
              // PostsScreen(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _quotesWidget(double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: $styles.insets.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: (width > 780) ? width / 3 : width / 1.2,
            child: Text(
              qotd['quote'],
              style: $styles.text.caption,
              softWrap: true,
            ),
          ),
          VSpace.sm,
          Text(
            '      -  ${qotd['author']}',
            style: $styles.text.caption,
          ),
        ],
      ),
    );
  }
}
