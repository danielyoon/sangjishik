import 'package:flutter/foundation.dart';
import 'package:sangjishik/core_packages.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const CustomBackButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    IconData backButtonIcon;

    if (defaultTargetPlatform == TargetPlatform.iOS) {
      backButtonIcon = Icons.arrow_back_ios;
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      backButtonIcon = Icons.arrow_back;
    } else if (defaultTargetPlatform == TargetPlatform.windows) {
      backButtonIcon = Icons.arrow_back;
    } else if (defaultTargetPlatform == TargetPlatform.linux) {
      backButtonIcon = Icons.arrow_back;
    } else {
      backButtonIcon = Icons.arrow_back;
    }

    return IconButton(
      padding: EdgeInsets.zero,
      splashRadius: .1,
      icon: Icon(backButtonIcon),
      onPressed: onPressed ??
          () {
            Navigator.maybePop(context);
          },
    );
  }
}
