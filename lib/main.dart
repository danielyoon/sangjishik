import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:sangjishik/core_packages.dart';

void main() {
  usePathUrlStrategy();
  runApp(const Sangjishik());
}

class Sangjishik extends StatelessWidget {
  const Sangjishik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
