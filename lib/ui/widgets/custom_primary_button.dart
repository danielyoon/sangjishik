import 'package:sangjishik/core_packages.dart';

class CustomPrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool logout;

  const CustomPrimaryButton({Key? key, this.onPressed, required this.text, this.logout = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: logout ? Colors.redAccent : Colors.black,
        minimumSize: const Size.fromHeight(45),
        disabledBackgroundColor: Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kExtraExtraSmall)),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: logout ? kBodyText.copyWith(color: Colors.white) : kBodyText,
      ),
    );
  }
}
