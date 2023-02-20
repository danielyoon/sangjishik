import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/app_scaffold.dart';
import 'package:sangjishik/user_interface/screens/home/home_screen.dart';

final appRouter = GoRouter(
  redirect: _handleRedirect,
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
        ),
      ],
    ),
  ],
);

String? _handleRedirect(BuildContext context, GoRouterState state) {
  return null;
}
