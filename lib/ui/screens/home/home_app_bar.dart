import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/ui/screens/home/login_popup.dart';
import 'package:sangjishik/controller/models/user.dart';
import 'package:sangjishik/controller/logic/auth_user.dart';
import 'package:sangjishik/ui/screens/home/logout_popup.dart';

class HomeAppBar extends StatelessWidget with GetItMixin {
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final VoidCallback openMenu;
  final bool showLoginMenu;
  final AnimationController animationController;

  HomeAppBar(
      {super.key,
      this.currentIndex = 0,
      required this.onTap,
      required this.openMenu,
      required this.showLoginMenu,
      required this.animationController});

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;
    User? currentUser = watchOnly((AuthUser x) => (x.user));
    bool isAdmin = watchOnly((AuthUser x) => x.isAdmin);

    return SizedBox(
      height: 55,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        centerTitle: (width > 700) ? false : true,
        title: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => onTap!(0),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 45),
              child: Image.asset(
                'assets/images/logo-transp.png',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
        actions: (width > 780)
            ? [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kExtraSmall),
                  child: CustomTextButton(text: 'About', onPressed: () => onTap!(1)),
                ),
                currentUser == null
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: kExtraSmall),
                        child: CustomTextButton(text: 'Login', onPressed: () => showLoginPopup(context)),
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(horizontal: kExtraSmall),
                        child: CustomTextButton(
                            text: 'Logout',
                            style: kBodyText.copyWith(color: Colors.redAccent),
                            onPressed: () => showLogoutPopup(context)),
                      ),
                isAdmin
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: kExtraSmall),
                        child: CustomTextButton(text: 'Create', onPressed: () => onTap!(2)))
                    : Container(),
              ]
            : [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kExtraSmall, vertical: kExtraSmall),
                  child: GestureDetector(
                    onTap: () {
                      if (animationController.isCompleted) {
                        animationController.reverse();
                      } else {
                        animationController.forward();
                      }
                      openMenu.call();
                    },
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: animationController,
                    ),
                  ),
                ),
              ],
      ),
    );
  }
}
