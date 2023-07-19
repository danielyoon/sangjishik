import 'package:flutter/gestures.dart';
import 'package:sangjishik/core_packages.dart';

//FIXME: Must fix this for mobile -- the Visit button gets squished
class Posts extends StatefulWidget {
  final String image;
  final String title;
  final DateTime date;

  const Posts({
    super.key,
    required this.image,
    required this.title,
    required this.date,
  });

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  bool isHover = false;
  bool isBtnHover = false;

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
            borderRadius: BorderRadius.circular($styles.insets.sm),
            color: isHover
                ? Color.fromARGB(75, 192, 184, 171)
                : Colors.transparent,
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.title, style: $styles.text.bodyBold),
                          Text(widget.date.toString(),
                              style: $styles.text.caption),
                        ],
                      ),
                      !isHover
                          ? Container()
                          : Flexible(
                              child: MouseRegion(
                                onEnter: (PointerEnterEvent event) =>
                                    setState(() {
                                  isBtnHover = true;
                                }),
                                onExit: (PointerExitEvent event) =>
                                    setState(() {
                                  isBtnHover = false;
                                }),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        $styles.insets.xxs),
                                    color: isBtnHover
                                        ? Colors.white
                                        : Color.fromARGB(255, 235, 235, 230),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all($styles.insets.xs),
                                    child: Text(
                                      'View Post',
                                      style: isBtnHover
                                          ? $styles.text.body
                                          : $styles.text.body.copyWith(
                                              color: Colors.grey[400]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ],
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
