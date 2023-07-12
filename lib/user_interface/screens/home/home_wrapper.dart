import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/home/home_app_bar.dart';

class HomeWrapper extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomeWrapper({super.key, required this.navigationShell});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(),
        Expanded(child: widget.navigationShell),
      ],
    );
  }
}
