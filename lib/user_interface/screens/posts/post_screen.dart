import 'package:sangjishik/core_packages.dart';

class PostScreen extends StatefulWidget {
  final String id;

  const PostScreen({super.key, required this.id});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.id),
    );
  }
}
