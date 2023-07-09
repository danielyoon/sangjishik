import 'package:sangjishik/core_packages.dart';

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
        scrolls.add(Text('${_numberToMonth(monthTracker)} $yearTracker'));
        monthTracker += 11;
        yearTracker -= 1;
      } else {
        scrolls.add(
          Text(_numberToMonth(monthTracker)),
        );
        monthTracker -= 1;
      }
    }

    return scrolls;
  }

  String _numberToMonth(int num) {
    switch (num) {
      case 1:
        return 'JAN';
      case 2:
        return 'FEB';
      case 3:
        return 'MAR';
      case 4:
        return 'APR';
      case 5:
        return 'MAY';
      case 6:
        return 'JUN';
      case 7:
        return 'JUL';
      case 8:
        return 'AUG';
      case 9:
        return 'SEP';
      case 10:
        return 'OCT';
      case 11:
        return 'NOV';
      case 12:
        return 'DEC';

      default:
        return 'EH?';
    }
  }
}

// for (int i = 0; i < sections; i++) {
// if (offset == 0) {
// offset += 12;
// monthTracker += 12;
//
// scrolls.add(
// Container(
// color: Colors.tealAccent,
// child: Row(
// children: [
// Column(
// children: [
// VSpace.med,
// Text('JAN'),
// Text(
// yearTracker.toString(),
// ),
// ],
// ),
// HSpace.sm,
// Column(
// children: [
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 1,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 1,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// ],
// ),
// ],
// ),
// ),
// );
// yearTracker--;
// } else {
// offset -= 1;
// scrolls.add(
// Container(
// color: Colors.amber,
// child: Row(
// children: [
// Column(
// children: [
// Text(_numberToMonth(monthTracker)),
// ],
// ),
// HSpace.sm,
// Expanded(
// child: Column(
// children: [
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 1,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 1,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// VSpace.xs,
// Divider(
// thickness: 1.0,
// height: 1.0,
// indent: 8,
// color: Colors.black,
// ),
// ],
// ),
// ),
// ],
// ),
// ),
// );
// monthTracker--;
// }
// }
