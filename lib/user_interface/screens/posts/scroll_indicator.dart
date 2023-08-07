import 'package:sangjishik/core_packages.dart';

class ScrollIndicator extends StatefulWidget {
  const ScrollIndicator({super.key});

  @override
  State<ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          width: 25,
          child: Divider(
            thickness: 3.0,
            height: 2.0,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }
}
