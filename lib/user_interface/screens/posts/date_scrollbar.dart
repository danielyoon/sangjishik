import 'package:sangjishik/core_packages.dart';

class DateScrollbar extends StatefulWidget {
  const DateScrollbar({super.key});

  @override
  State<DateScrollbar> createState() => _DateScrollbarState();
}

class _DateScrollbarState extends State<DateScrollbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: buildRulerMarks(),
        ),
      ),
    );
  }

  List<Widget> buildRulerMarks() {
    List<Widget> marks = [];
    for (int i = 0; i <= 100; i++) {
      marks.add(
        Row(
          children: [
            Text('$i'),
            HSpace.sm, // Adjust spacing between number and divider
            Expanded(
              child: Divider(
                thickness: 1.0,
                height: 1.0,
                indent: (i % 2 == 0) ? 10 : 1,
                color: Colors.black,
              ),
            ),
          ],
        ),
      );
    }
    return marks;
  }
}
