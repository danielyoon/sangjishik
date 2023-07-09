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
      width: 45,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: rulerPin(350),
        ),
      ),
    );
  }

  List<Divider> rulerPin(int count) {
    return List.generate(count, (i) {
      return Divider(
        height: 6.299,
        thickness: 1,
      );
    }).toList();
  }
}
