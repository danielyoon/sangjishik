import 'package:sangjishik/core_packages.dart';

class TagPopup extends StatefulWidget {
  const TagPopup({super.key});

  @override
  State<TagPopup> createState() => _TagPopupState();
}

class _TagPopupState extends State<TagPopup> {
  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('TEST'),
    );
  }
}
