import 'package:sangjishik/core_packages.dart';

class LoginMenu extends StatefulWidget {
  final ValueChanged<int>? onTap;

  const LoginMenu({super.key, this.onTap});

  @override
  State<LoginMenu> createState() => _LoginMenuState();
}

class _LoginMenuState extends State<LoginMenu> {
  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;
    double height = context.heightPx;

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
            CustomTextButton(
              text: 'Login',
              style: kHeader.copyWith(color: Colors.black, fontSize: kLarge),
              onPressed: () => print('LOGIN'),
            ),
            Gap(kLarge),
            CustomTextButton(
              text: 'Create',
              style: kHeader.copyWith(color: Colors.black, fontSize: kLarge),
              onPressed: () => widget.onTap!(2),
            ),
          ],
        ),
      ),
    );
  }
}
