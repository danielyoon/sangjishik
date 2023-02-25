import 'package:sangjishik/business_logic/utils/device_info.dart';
import 'package:sangjishik/core_packages.dart';

//TODO: Import posts instead of Strings!
//TODO: Check sizing of posts?
class StyledPosts extends StatelessWidget {
  final String post1;
  final String? post2;
  final String? post3;

  const StyledPosts({Key? key, required this.post1, this.post2, this.post3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;
    double height = context.heightPx;

    bool isMobile = DeviceScreen.isPhone(context);
    bool isTablet = DeviceScreen.isTablet(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return isMobile
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width / 1.5,
                    height: width / 1.5,
                    color: Colors.redAccent,
                    child: Center(
                      child: Text(post1),
                    ),
                  ),
                ],
              )
            : isTablet
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: width / 2.5,
                        height: width / 2,
                        color: Colors.redAccent,
                        child: Center(
                          child: Text(post1),
                        ),
                      ),
                      post2 == null
                          ? Container()
                          : Container(
                              width: width / 2.5,
                              height: width / 2,
                              color: Colors.greenAccent,
                              child: Center(
                                child: Text(post2!),
                              ),
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
                        child: Center(
                          child: Text(post1),
                        ),
                      ),
                      post2 == null
                          ? Container()
                          : Container(
                              width: width / 5,
                              height: width / 4.5,
                              color: Colors.greenAccent,
                              child: Center(
                                child: Text(post2!),
                              ),
                            ),
                      post3 == null
                          ? Container()
                          : Container(
                              width: width / 5,
                              height: width / 4.5,
                              color: Colors.greenAccent,
                              child: Center(
                                child: Text(post3!),
                              ),
                            ),
                    ],
                  );
      },
    );
  }
}
