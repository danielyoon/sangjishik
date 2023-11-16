import 'package:sangjishik/core_packages.dart';

Future<void> showLogoutPopup<T>(BuildContext context) async {
  return showDialog(context: context, builder: (context) => LogoutPopup());
}

class LogoutPopup extends StatelessWidget {
  const LogoutPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      title: Padding(
        padding: EdgeInsets.only(top: kMedium),
        child: Center(
          child: Text(
            'Logout?',
            style: kHeader,
          ),
        ),
      ),
      content: Text('Are you sure you want to logout?'),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: CustomPrimaryButton(text: 'Cancel', onPressed: () => appRouter.pop())),
            Gap(kMedium),
            Expanded(
              child: CustomPrimaryButton(
                  text: 'Logout',
                  logout: true,
                  onPressed: () {
                    auth.setUser(null);
                    appRouter.pop();
                  }),
            ),
          ],
        ),
      ],
      actionsPadding: EdgeInsets.only(left: kMedium, right: kMedium, bottom: kMedium),
    );
  }
}
