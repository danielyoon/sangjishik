import 'package:sangjishik/core_packages.dart';

class QuoteText extends StatelessWidget {
  final String text;

  const QuoteText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}

class AuthorText extends StatelessWidget {
  final String text;

  const AuthorText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text);
  }
}
