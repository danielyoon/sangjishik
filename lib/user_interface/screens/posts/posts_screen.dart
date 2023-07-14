import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/posts/date_scrollbar.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  Widget build(BuildContext context) {
    double height = context.heightPx;

    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: $styles.insets.lg),
        child: SizedBox(
          height: double.infinity,
          child: Row(
            children: [
              Expanded(
                flex: 50,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1.3,
                        children: [],
                      ),
                    ),
                    VSpace.xl,
                  ],
                ),
              ),
              HSpace.lg,
              DateScrollbar(),
            ],
          ),
        ),
      ),
    );
  }
}
