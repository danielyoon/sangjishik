import 'package:flutter/gestures.dart';
import 'package:sangjishik/controller/utils/string_utils.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/data/temp_posts.dart';

class PostGrid extends StatelessWidget {
  const PostGrid({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;

    int getCrossAxisCount() {
      if (width < 600) return 1;
      if (width < 1000) return 2;
      if (width < 1440) return 3;

      return 4;
    }

    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kLarge),
        child: GridView.count(
          crossAxisCount: getCrossAxisCount(),
          crossAxisSpacing: kMedium,
          mainAxisSpacing: kMedium,
          childAspectRatio: 1.4,
          children: tempPosts.map((post) {
            return GridTile(
              child: PostWidget(
                image: post['image'],
                title: post['title'],
                date: post['date'],
                onPressed: () => print('TEST!'),
              ),
            );
          }).toList(), // Convert the Iterable back to a List
        ),
      ),
    );
  }
}

class PostWidget extends StatefulWidget {
  final String image;
  final String title;
  final DateTime date;
  final VoidCallback onPressed;

  const PostWidget({super.key, required this.image, required this.title, required this.date, required this.onPressed});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
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
        onTap: widget.onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kExtraSmall),
            color: isHover ? Color.fromARGB(75, 192, 184, 171) : Colors.transparent,
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: kSmall, right: kSmall, top: kSmall, bottom: kExtraSmall),
                  child: Image.network(
                    widget.image,
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: kSmall),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: kExtraExtraSmall,
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: '${widget.title}\n',
                                style: kBodyText,
                              ),
                              TextSpan(text: StringUtils.formatDateTime(widget.date), style: kGreyText),
                            ],
                          ),
                        ),
                      ),
                      isHover
                          ? Positioned(
                              right: 0,
                              top: kExtraExtraSmall - 4,
                              child: MouseRegion(
                                onEnter: (PointerEnterEvent event) => setState(() {
                                  isBtnHover = true;
                                }),
                                onExit: (PointerExitEvent event) => setState(() {
                                  isBtnHover = false;
                                }),
                                child: GestureDetector(
                                  onTap: widget.onPressed,
                                  child: Opacity(
                                    opacity: isHover ? 1.0 : 0.0,
                                    child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: kSmall, vertical: kExtraExtraSmall),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(kExtraExtraSmall),
                                        color: isBtnHover ? Colors.white : Color.fromARGB(255, 235, 235, 230),
                                      ),
                                      child: Text(
                                        'Visit',
                                        style: kBodyText.copyWith(
                                            color: isBtnHover ? Colors.black : Colors.black.withOpacity(.2),
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
