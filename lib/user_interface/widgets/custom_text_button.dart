import 'package:sangjishik/core_packages.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool logout;
  final TextStyle? style;

  const CustomTextButton({Key? key, required this.text, this.onPressed, this.logout = false, this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        padding: EdgeInsets.zero,
      ).copyWith(overlayColor: MaterialStateProperty.all(Colors.transparent)),
      onPressed: onPressed,
      child: Text(
        text,
        style: style ?? kBodyText,
      ),
    );
  }
}
