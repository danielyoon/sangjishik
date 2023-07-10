import 'package:flutter/gestures.dart';
import 'package:sangjishik/core_packages.dart';

class MonthBox extends StatefulWidget {
  final int monthTracker;

  const MonthBox({super.key, required this.monthTracker});

  @override
  State<MonthBox> createState() => _MonthBoxState();
}

class _MonthBoxState extends State<MonthBox> {
  bool isHover = false;

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
            color: isHover
                ? Colors.lightBlueAccent.withOpacity(.2)
                : Colors.transparent,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HSpace.xs,
              Column(
                children: [
                  Text(
                    _numberToMonth(widget.monthTracker),
                    style: $styles.text.bodySmall.copyWith(height: 1.5),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    VSpace.xs,
                    SizedBox(
                      width: 18,
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    VSpace.xs,
                    SizedBox(
                      width: 7,
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    VSpace.xs,
                    SizedBox(
                      width: 7,
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    VSpace.xs,
                    SizedBox(
                      width: 7,
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    VSpace.xs,
                    SizedBox(
                      width: 18,
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    VSpace.xs,
                    SizedBox(
                      width: 7,
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    VSpace.xs,
                    SizedBox(
                      width: 7,
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ),
                    VSpace.xs,
                    SizedBox(
                      width: 7,
                      child: Divider(
                        thickness: 1.0,
                        height: 1.0,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
