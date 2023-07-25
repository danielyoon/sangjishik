import 'package:sangjishik/core_packages.dart';

class StyledElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const StyledElevatedButton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(45),
        disabledBackgroundColor: Colors.grey[300],
        backgroundColor: $styles.colors.primary,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: $styles.text.btn,
        textAlign: TextAlign.center,
      ),
    );
  }
}
