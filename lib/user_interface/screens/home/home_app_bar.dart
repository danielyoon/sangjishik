import 'package:sangjishik/controller/logic/login.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/home/login_popup.dart';
import 'package:sangjishik/controller/logic/auth_user.dart';

class HomeAppBar extends StatelessWidget with GetItMixin {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  HomeAppBar({super.key, this.currentIndex = 0, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = watchOnly((Login m) => m.isLoggedIn);
    bool isAdmin = watchOnly((AuthUser m) => m.isAdmin);
    double width = context.widthPx;

    return SizedBox(
      height: 55,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: $styles.colors.primary,
        title: Padding(
          padding: EdgeInsets.all($styles.insets.sm),
          child: GestureDetector(onTap: () => onTap!(0), child: Text('LOGO HERE')),
        ),
        actions: (width > 780)
            ? [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                  child: StyledTextButton(text: 'About', onPressed: () => onTap!(1)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                  child: StyledTextButton(text: 'Login', onPressed: () => showLoginDialog(context)),
                ),
                isLoggedIn && isAdmin
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: $styles.insets.sm),
                        child: StyledTextButton(text: 'Create', onPressed: () => onTap!(2)),
                      )
                    : Container(),
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
