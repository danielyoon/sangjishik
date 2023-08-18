import 'package:sangjishik/business_logic/utils/string_utils.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/posts/post_widget.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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

    List<PostWidget> generatePosts() {
      List<PostWidget> myPosts = [];
      for (int i = 0; i < appModel.posts.length; i++) {
        String title = StringUtils.replaceSpacesWithHyphens(appModel.posts[i].title);
        myPosts.add(PostWidget(
          title: appModel.posts[i].title,
          image: appModel.posts[i].image,
          date: appModel.posts[i].date,
          onTap: () => context.go('/post/$title'),
        ));
      }

      return myPosts;
    }

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
                        controller: _scrollController,
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
              width < 380 ? HSpace.sm : HSpace.lg,
              // DateScrollbar(scroll: currentScrollOffset),
            ],
          ),
        ),
      ),
    );
  }
}
