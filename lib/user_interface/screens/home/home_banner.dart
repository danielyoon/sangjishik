import 'package:sangjishik/core_packages.dart';

class HomeBanner extends StatelessWidget {
  final String background;
  final double height;
  final double width;
  final VoidCallback onTap;

  const HomeBanner(
      {Key? key,
      required this.background,
      required this.height,
      required this.width,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Padding(
        padding: EdgeInsets.only(
            top: $styles.insets.md,
            left: $styles.insets.md,
            right: $styles.insets.md,
            bottom: width < 700 ? $styles.insets.xxl : $styles.insets.md),
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.network(
                background,
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Text('LOGO'),
            ),
            GestureDetector(
              onTap: onTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: $styles.insets.xl,
                      width: $styles.insets.xl,
                      // padding: EdgeInsets.all($styles.insets.sm),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                              color: $styles.colors.white, width: 2)),
                      child: Center(
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: $styles.colors.white,
                          size: $styles.insets.lg,
                        ),
                      ),
                    ),
                  ),
                  VSpace.lg,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
