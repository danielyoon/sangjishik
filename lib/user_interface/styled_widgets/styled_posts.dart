import 'package:sangjishik/business_logic/utils/device_info.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sized_context/sized_context.dart';

class StyledPosts extends StatelessWidget {
  final bool isSmallScreen;

  const StyledPosts({Key? key, required this.isSmallScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;
    double height = context.heightPx;

    // DeviceScreen.isTablet(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return isSmallScreen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width / 1.5,
                    height: width / 1.5,
                    color: Colors.redAccent,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width / 5,
                    height: width / 4.5,
                    color: Colors.redAccent,
                  ),
                  Container(
                    width: width / 5,
                    height: width / 4.5,
                    color: Colors.greenAccent,
                  ),
                  Container(
                    width: width / 5,
                    height: width / 4.5,
                    color: Colors.blueAccent,
                  ),
                ],
              );
      },
    );
  }
}
