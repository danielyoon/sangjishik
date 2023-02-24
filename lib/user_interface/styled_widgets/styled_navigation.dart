import 'package:sangjishik/core_packages.dart';

//TODO: Consider using dialog.fullscreen with hero tag on icon button
class StyledNavigation extends StatelessWidget {
  final double height;
  final double width;

  const StyledNavigation({Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: $styles.colors.white,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all($styles.insets.xs),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                splashRadius: 1,
                onPressed: () => print('TEST'),
                icon: Icon(Icons.close),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text('HELLO'),
          )
        ],
      ),
    );
  }
}
