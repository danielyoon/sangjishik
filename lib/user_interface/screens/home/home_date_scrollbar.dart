import 'package:sangjishik/core_packages.dart';

class HomeDateScrollbar extends StatelessWidget {
  const HomeDateScrollbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: rulerPin(350),
      ),
    );
  }

  List<Divider> rulerPin(int count) {
    return List.generate(count, (i) {
      return Divider(
        height: 6.299,
        thickness: 1,
      );
    }).toList();
  }
}
