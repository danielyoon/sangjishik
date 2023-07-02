import 'package:sangjishik/core_packages.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;

    return SizedBox(
      height: 55,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: $styles.colors.primary,
        title: Padding(
          padding: EdgeInsets.all($styles.insets.sm),
          child: Text('LOGO HERE'),
        ),
        actions: (width > 780)
            ? [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                  child: StyledTextButton(
                      text: 'About', onPressed: () => print('ABOUT')),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                  child: StyledTextButton(
                      text: 'Login', onPressed: () => print('Login')),
                ),
              ]
            : [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    splashRadius: 1,
                    onPressed: () => print('MENU!'),
                  ),
                ),
              ],
      ),
    );
  }
}
