import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/posts/january_box.dart';
import 'package:sangjishik/user_interface/screens/posts/month_box.dart';

class DateScrollbar extends StatefulWidget {
  const DateScrollbar({super.key});

  @override
  State<DateScrollbar> createState() => _DateScrollbarState();
}

class _DateScrollbarState extends State<DateScrollbar> {
  int startYear = 2021;
  int startMonth = 2;

  int currentYear = 2023;
  int currentMonth = 7;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children:
              buildScrollbar(currentMonth, startMonth, currentYear, startYear),
        ),
      ),
    );
  }

  List<Widget> buildScrollbar(
      int currentMonth, int startMonth, int currentYear, int startYear) {
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
