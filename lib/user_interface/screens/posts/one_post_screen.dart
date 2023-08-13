import 'package:sangjishik/core_packages.dart';

class OnePostScreen extends StatefulWidget {
  final String id;

  const OnePostScreen({super.key, required this.id});

  @override
  State<OnePostScreen> createState() => _OnePostScreenState();
}

class _OnePostScreenState extends State<OnePostScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.id),
    );
  }
}
