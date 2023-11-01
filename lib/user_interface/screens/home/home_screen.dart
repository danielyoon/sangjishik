import 'dart:math';

import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/home/post_grid.dart';
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
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: kLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(kMedium),
                _quotesWidget(width),
                Gap(kExtraLarge),
                PostGrid(),
                Gap(kLarge),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _quotesWidget(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: (width > 780) ? width / 3 : width / 1.2,
          child: Text(
            qotd['quote'],
            softWrap: true,
          ),
        ),
        Gap(kSmall),
        Text(
          '      -  ${qotd['author']}',
        ),
      ],
    );
  }
}
