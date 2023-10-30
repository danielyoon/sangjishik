import 'package:sangjishik/core_packages.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        scrollbarTheme: ScrollbarThemeData(thumbColor: MaterialStateProperty.all((Colors.transparent))),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kLarge),
        child: SingleChildScrollView(
          child: Column(),
        ),
      ),
    );
  }
}
