import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/business_logic/models/post.dart';

class OnePostScreen extends StatefulWidget {
  final String title;

  const OnePostScreen({super.key, required this.title});

  @override
  State<OnePostScreen> createState() =>
      _OnePostScreenState();
}

class _OnePostScreenState extends State<OnePostScreen> {
  late Post post;

  @override
  void initState() {
    post = appModel.posts
        .firstWhere((post) => post.title == widget.title);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> generateTags() {
      List<Widget> tags = [];

      for (int i = 0; i < post.tags.length; i++) {
        tags.add(TagWidget(tag: post.tags[i]));
        tags.add(HSpace.sm);
      }

      return tags;
    }

    //TODO: If it is not desktop/laptop, move comments to bottom
    double width = context.widthPx;
    double height = context.heightPx;

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: $styles.insets.xxl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Some Long Title', style: $styles.text.h2),
          VSpace.med,
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                          thumbColor:
                              MaterialStateProperty.all(
                                  (Colors.transparent))),
                    ),
                    child: ListView(
                      padding: EdgeInsets.only(
                          right: $styles.insets.xxl,
                          left: $styles.insets.md),
                      children: [
                        //TODO: Add Hero tag on Image
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: width,
                              maxHeight: height * 2),
                          child: AspectRatio(
                            aspectRatio: 4 / 3,
                            child: Image.network(
                              post.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        VSpace.med,
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                          style: $styles.text.body,
                        ),
                        VSpace.med,
                        Row(children: generateTags()),
                      ],
                    ),
                  ),
                ),
                HSpace.sm,
                Expanded(
                  flex: 1,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      scrollbarTheme: ScrollbarThemeData(
                          thumbColor:
                              MaterialStateProperty.all(
                                  (Colors.transparent))),
                    ),
                    child: ListView(
                      children: [
                        Text('Comments:',
                            style: $styles.text.h3),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          VSpace.xl,
        ],
      ),
    );
  }
}

class TagWidget extends StatelessWidget {
  final String tag;

  const TagWidget({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    Color? getColorFromString(String tag) {
      if (tag == 'Personal') return Colors.green;
      if (tag == 'Bible') return Colors.brown[300];
      if (tag == 'KPOP') return Colors.pinkAccent[100];
      if (tag == 'Programming')
        return Colors.blueAccent[200];
      if (tag == 'Fashion') return Colors.amberAccent;
      if (tag == 'Tetris') return Colors.purple[300];
      if (tag == 'Books') return Colors.grey[400];
      if (tag == 'Food') return Colors.red[300];
      if (tag == 'History') return Colors.orangeAccent;
      if (tag == 'Random') return Colors.black;
      if (tag == 'Funny') return Colors.yellow;

      return Colors.redAccent;
    }

    return Container(
      decoration: BoxDecoration(
        color: getColorFromString(tag),
        borderRadius:
            BorderRadius.circular($styles.insets.xxs),
      ),
      child: Padding(
        padding: EdgeInsets.all($styles.insets.xxs),
        child: Text(tag,
            style: $styles.text.bodyBold
                .copyWith(color: Colors.white)),
      ),
    );
  }
}
