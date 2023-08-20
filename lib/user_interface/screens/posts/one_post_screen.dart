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
          VSpace.xs,
          Row(children: generateTags()),
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
                      padding: EdgeInsets.symmetric(
                          horizontal: $styles.insets.xxl),
                      children: [
                        Container(
                          color: Colors.amberAccent,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                                maxWidth: width,
                                maxHeight: height * 2),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                post.image,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        Text('END!'),
                      ],
                    ),
                  ),
                ),
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
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        VSpace.xl,
                        Text('End!'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
    //TODO: Set some distinct colors for different tags
    Color getColorFromString(String tag) {
      if (tag == 'Personal') return Colors.black;

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
