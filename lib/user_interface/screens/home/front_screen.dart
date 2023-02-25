import 'dart:math';

import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/home/quoted_text.dart';
import 'package:sangjishik/user_interface/screens/home/home_post_buttons.dart';
import 'package:sangjishik/business_logic/data/quotes.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  String quote = '';
  String author = '';

  @override
  void initState() {
    super.initState();

    getQuote();
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
    double width = context.widthPx;

    bool isSmallScreen = context.widthPx < 700;

    List<Row> rowOfPosts = [];

    return Padding(
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
            StyledPosts(post1: 'POST1', post2: 'POST2', post3: 'POST3'),
            VSpace.med,
            ...rowOfPosts,
            ElevatedButton(
              onPressed: () => print('TEST'),
              child: Text('LOAD MORE'),
            ),
          ],
        ),
      ),
    );
  }
}
