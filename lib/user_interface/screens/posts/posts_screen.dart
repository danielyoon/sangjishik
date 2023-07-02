import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/posts/date_scrollbar.dart';
import 'package:sangjishik/user_interface/screens/posts/posts.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: $styles.insets.lg),
      child: Row(
        children: [
          Expanded(
            flex: 10,
            child: Posts(),
          ),
          Expanded(
            child: DateScrollbar(),
          ),
        ],
      ),
    );
  }
}
