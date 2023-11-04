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
    double width = context.widthPx;

    //TODO: If user is logged in, turn login into logout
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
              )),
        ),
        actions: (width > 780)
            ? [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kExtraSmall),
                  child: CustomTextButton(text: 'About', onPressed: () => onTap!(1)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kExtraSmall),
                  child: CustomTextButton(text: 'Login', onPressed: () => showLoginPopup(context)),
                ),
                // isLoggedIn && isAdmin
                //     ? Padding(
                //         padding: EdgeInsets.symmetric(horizontal: kExtraSmall),
                //         child: CustomTextButton(text: 'Create', onPressed: () => onTap!(2)))
                //     : Container(),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: kExtraSmall),
                    child: CustomTextButton(text: 'Create', onPressed: () => onTap!(2))),
              ]
            : [
                //TODO: Create side bar menu
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: kExtraSmall),
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
