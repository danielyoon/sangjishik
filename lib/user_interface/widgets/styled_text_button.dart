import 'package:sangjishik/core_packages.dart';

class StyledTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool logout;

  const StyledTextButton({Key? key, required this.text, this.onPressed, this.logout = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateColor.resolveWith((states) => kPrimary),
        overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
      ),
      onPressed: onPressed,
      child: Text(text, style: logout ? kBodyText : kBodyText),
    );
  }
}
