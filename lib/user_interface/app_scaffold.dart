import 'package:sangjishik/core_packages.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;

  const AppScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        clipBehavior: Clip.antiAlias,
        children: [
          SafeArea(
            child: Container(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
