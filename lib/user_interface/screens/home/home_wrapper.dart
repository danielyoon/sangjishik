import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/home/home_app_bar.dart';

class HomeWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeWrapper({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    void onTap(int index) {
      navigationShell.goBranch(index,
          initialLocation: index == navigationShell.currentIndex);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeAppBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (int index) => onTap(index),
        ),
        Expanded(child: navigationShell),
      ],
    );
  }
}
