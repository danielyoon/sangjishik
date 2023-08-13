import 'package:sangjishik/business_logic/utils/string_utils.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/posts/date_scrollbar.dart';
import 'package:sangjishik/user_interface/screens/posts/post_widget.dart';

import 'package:sangjishik/business_logic/data/temp_posts.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  late ScrollController _scrollController;
  double currentScrollOffset = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {
        currentScrollOffset = _scrollController.offset; // Update the scroll offset
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
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

    List<Widget> generatePosts() {
      List<Widget> myPosts = [];
      for (int i = 0; i < tempPosts.length; i++) {
        String title = StringUtils.replaceSpacesWithHyphens(tempPosts[i]['title']);
        myPosts.add(PostWidget(
          title: tempPosts[i]['title'],
          image: tempPosts[i]['image'],
          date: tempPosts[i]['date'],
          onTap: () => context.go('/post/$title'),
        ));
      }

      return myPosts;
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
              Expanded(child: CustomScrollIndicator(controller: _scrollController)),
              // DateScrollbar(scroll: currentScrollOffset),
            ],
          ),
        ),
      ),
    );
  }
}
