import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/controller/logic/auth_user.dart';
import 'package:sangjishik/controller/models/user.dart';
import 'package:sangjishik/user_interface/screens/home/logout_popup.dart';

class LoginMenu extends StatefulWidget with GetItStatefulWidgetMixin {
  final ValueChanged<int>? onTap;

  LoginMenu({super.key, this.onTap});

  @override
  State<LoginMenu> createState() => _LoginMenuState();
}

class _LoginMenuState extends State<LoginMenu> with GetItStateMixin {
  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;
    double height = context.heightPx;

    User? currentUser = watchOnly((AuthUser x) => (x.user));
    bool isAdmin = watchOnly((AuthUser x) => x.isAdmin);

    //TODO: Setup logout popup
    return Container(
      width: width,
      height: height,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kExtraExtraLarge),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(kExtraExtraLarge),
            CustomTextButton(
              text: 'About',
              style: kHeader.copyWith(color: Colors.black, fontSize: kLarge),
              onPressed: () => widget.onTap!(1),
            ),
            Gap(kLarge),
            //TODO: Setup mobile login screen
            currentUser == null
                ? CustomTextButton(
                    text: 'Login',
                    style: kHeader.copyWith(color: Colors.black, fontSize: kLarge),
                    onPressed: () => widget.onTap!(3),
                  )
                : CustomTextButton(
                    text: 'Logout',
                    style: kHeader.copyWith(color: Colors.redAccent, fontSize: kLarge),
                    onPressed: () => showLogoutPopup(context),
                  ),
            Gap(kLarge),
            isAdmin
                ? CustomTextButton(
                    text: 'Create',
                    style: kHeader.copyWith(color: Colors.black, fontSize: kLarge),
                    onPressed: () => widget.onTap!(2),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
