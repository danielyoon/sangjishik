import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/posts/date_scrollbar.dart';
import 'package:sangjishik/user_interface/screens/posts/posts.dart';

import 'package:sangjishik/business_logic/data/temp_posts.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Widget> generatePosts() {
    List<Widget> myPosts = [];
    for (int i = 0; i < tempPosts.length; i++) {
      myPosts.add(Posts(
        title: tempPosts[i]['title'],
        image: tempPosts[i]['image'],
        date: tempPosts[i]['date'],
      ));
    }

    return myPosts;
  }

  @override
  Widget build(BuildContext context) {
    int calculateNumberOfPosts(int screenWidth) {
      if (screenWidth >= 1451) {
        return 4;
      } else if (screenWidth >= 1117) {
        return 3;
      } else if (screenWidth >= 696) {
        return 2;
      } else {
        return 1;
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
                        children: generatePosts(),
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
