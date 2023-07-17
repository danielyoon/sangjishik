import 'package:sangjishik/core_packages.dart';

import 'login_popup.dart';

class HomeAppBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  const HomeAppBar({super.key, this.currentIndex = 0, required this.onTap});

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
          child:
              GestureDetector(onTap: () => onTap!(0), child: Text('LOGO HERE')),
        ),
        actions: (width > 780)
            ? [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                  child: StyledTextButton(
                      text: 'About', onPressed: () => onTap!(1)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                  child: StyledTextButton(
                      text: 'Login', onPressed: () => showLoginDialog(context)),
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
