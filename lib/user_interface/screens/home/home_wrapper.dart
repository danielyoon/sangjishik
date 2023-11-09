import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/screens/home/home_app_bar.dart';
import 'package:sangjishik/user_interface/screens/home/login_menu.dart';

class HomeWrapper extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const HomeWrapper({super.key, required this.navigationShell});

  @override
  State<HomeWrapper> createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool showLoginMenu = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleMenuBar() {
    setState(() {
      showLoginMenu = !showLoginMenu;
    });
    showLoginMenu == true ? _animationController.forward() : _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    double width = context.widthPx;

    void onTap(int index) {
      widget.navigationShell.goBranch(index, initialLocation: index == widget.navigationShell.currentIndex);

      if (showLoginMenu) toggleMenuBar();
    }

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeAppBar(
              currentIndex: widget.navigationShell.currentIndex,
              onTap: onTap,
              openMenu: toggleMenuBar,
              showLoginMenu: showLoginMenu,
              animationController: _animationController,
            ),
            Expanded(child: widget.navigationShell),
          ],
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          top: 55,
          bottom: 0,
          right: showLoginMenu ? 0 : -width,
          left: showLoginMenu ? 0 : width,
          child: Visibility(visible: width < 799, child: LoginMenu(onTap: onTap)),
        ),
      ],
    );
  }
}
