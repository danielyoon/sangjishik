import 'package:flutter/gestures.dart';
import 'package:sangjishik/core_packages.dart';

class Posts extends StatefulWidget {
  final String image;
  final String title;
  final DateTime date;
  final List<String> topics;

  const Posts({
    super.key,
    required this.image,
    required this.title,
    required this.date,
    required this.topics,
  });

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<Widget> topicWidgets = [];

  bool isHover = false;

  @override
  void initState() {
    super.initState();

    topicWidgets =
        widget.topics.map((String topic) => TopicBox(topic: topic)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (PointerEnterEvent event) => setState(() {
        isHover = true;
      }),
      onExit: (PointerExitEvent event) => setState(() {
        isHover = false;
      }),
      child: GestureDetector(
        onTap: () => print('TEST'),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular($styles.insets.xs),
            color: isHover ? Colors.grey.withOpacity(.2) : Colors.transparent,
          ),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all($styles.insets.sm),
                    child: LimitedBox(
                      maxHeight: 300,
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          widget.image,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                  child: Text(widget.title, style: $styles.text.bodyBold),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                  child:
                      Text(widget.date.toString(), style: $styles.text.caption),
                ),
                VSpace.sm,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                  child: Row(
                    children: topicWidgets,
                  ),
                ),
                VSpace.sm,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopicBox extends StatelessWidget {
  final String topic;

  const TopicBox({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    MaterialColor getColor(String topic) {
      return Colors.grey;
    }

    return Padding(
      padding: EdgeInsets.only(right: $styles.insets.sm),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.pink,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all($styles.insets.xxs),
            child: Text(topic),
          ),
        ),
      ),
    );
  }
}
