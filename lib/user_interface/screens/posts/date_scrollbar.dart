import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/posts/january_box.dart';
import 'package:sangjishik/user_interface/screens/posts/month_box.dart';
import 'package:sangjishik/user_interface/screens/posts/scroll_indicator.dart';
import 'package:sangjishik/business_logic/models/post.dart';

class DateScrollbar extends StatefulWidget {
  final double scroll;

  const DateScrollbar({super.key, required this.scroll});

  @override
  State<DateScrollbar> createState() => _DateScrollbarState();
}

class _DateScrollbarState extends State<DateScrollbar> {
  List<Post> posts = appModel.listOfPosts.value;

  int startYear = 2021;
  int startMonth = 2;

  int currentYear = 2023;
  int currentMonth = 7;

  @override
  Widget build(BuildContext context) {
    print(widget.scroll);

    return SizedBox(
      width: 60,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Positioned(
                  right: 0,
                  top: widget.scroll,
                  child: ScrollIndicator(),
                ),
                Column(
                  children: buildScrollbar(currentMonth, startMonth, currentYear, startYear),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //TODO: Probably will have to make a longer box (with more dividers) if my posts exceed an x amount
  List<Widget> buildScrollbar(int currentMonth, int startMonth, int currentYear, int startYear) {
    List<Widget> scrolls = [];

    int year = currentYear - startYear;
    int month = (currentMonth - startMonth).abs();
    int sections = month + (year * 12);

    int yearTracker = currentYear;
    int monthTracker = currentMonth;

    for (int i = 0; i <= sections; i++) {
      if (monthTracker == 1) {
        scrolls.add(
          JanuaryBox(monthTracker: monthTracker, yearTracker: yearTracker),
        );
        monthTracker += 11;
        yearTracker -= 1;
      } else {
        scrolls.add(
          MonthBox(monthTracker: monthTracker),
        );
        monthTracker -= 1;
      }
    }

    return scrolls;
  }
}

class CustomScrollIndicator extends StatelessWidget {
  final ScrollController controller;

  const CustomScrollIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Get the Scrollable widget's viewport dimension and scroll position
        final double viewportHeight = constraints.maxHeight;
        final double scrollPosition = controller.hasClients ? controller.offset : 0.0;
        final double maxScrollExtent =
            controller.hasClients ? controller.position.maxScrollExtent : 0.0;
        final double minScrollExtent =
            controller.hasClients ? controller.position.minScrollExtent : 0.0;

        // Calculate the height and position of the thumb
        final double thumbHeight =
            viewportHeight * viewportHeight / (maxScrollExtent - minScrollExtent + viewportHeight);
        final double thumbTop =
            scrollPosition * (viewportHeight - thumbHeight) / (maxScrollExtent - minScrollExtent);

        return GestureDetector(
          onVerticalDragUpdate: (dragDetails) {
            controller.jumpTo(controller.offset +
                dragDetails.delta.dy *
                    (maxScrollExtent - minScrollExtent) /
                    (viewportHeight - thumbHeight));
          },
          child: Container(
            width: 16, // Set the width of the indicator
            height: viewportHeight,
            color: Colors.grey[300], // Set the background color of the indicator
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 16,
                height: thumbHeight,
                color: Colors.grey[700], // Set the thumb color
                margin: EdgeInsets.only(top: thumbTop),
              ),
            ),
          ),
        );
      },
    );
  }
}
