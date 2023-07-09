import 'package:sangjishik/core_packages.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;

  static AppStyle get style => _style;
  static AppStyle _style = AppStyle();

  const AppScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _style = AppStyle(screenSize: context.sizePx);
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all((Colors.transparent))),
        ),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            SafeArea(
              top: false,
              bottom: false,
              child: Container(
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
