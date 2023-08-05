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
    int calculateNumberOfPosts(int screenWidth) {
      if (screenWidth >= 1300) {
        return 4; // Display 4 posts for larger screens
      } else if (screenWidth >= 1000) {
        return 3; // Display 3 posts for medium-sized screens
      } else if (screenWidth >= 700) {
        return 2; // Display 2 posts for smaller screens
      } else {
        return 1; // Display 1 post for the smallest screens
      }
    }

    double height = context.heightPx;
    double width = context.widthPx;
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
                        crossAxisCount: calculateNumberOfPosts(width as int),
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 1,
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
