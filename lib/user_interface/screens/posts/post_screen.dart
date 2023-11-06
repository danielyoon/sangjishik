import 'package:sangjishik/core_packages.dart';

class PostScreen extends StatelessWidget {
  final String title;

  const PostScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}
