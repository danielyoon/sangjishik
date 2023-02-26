import 'package:sangjishik/core_packages.dart';

//TODO: Setup style
class StyledTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const StyledTextButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: $styles.colors.black)),
    );
  }
}
