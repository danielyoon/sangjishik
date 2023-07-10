import 'package:sangjishik/core_packages.dart';

class StyledDividers extends StatelessWidget {
  final double size;

  const StyledDividers({super.key, required this.size});

  @override
  Widget build(BuildContext context) => Container(
        width: size,
        height: 1,
        color: Colors.black,
      );

  static StyledDividers get long => StyledDividers(size: 20);

  static StyledDividers get short => StyledDividers(size: 10);
}
