import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/app_scaffold.dart';
import 'package:sangjishik/user_interface/screens/home/home_screen.dart';

//TODO: Implement: https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter/
final appRouter = GoRouter(
  redirect: _handleRedirect,
  routes: [
    ShellRoute(
      builder: (context, state, child) => AppScaffold(child: child),
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => HomeScreen(),
          routes: [],
        ),
      ],
    ),
  ],
);

String? _handleRedirect(BuildContext context, GoRouterState state) {
  debugPrint('Navigate to: ${state.location}');
  return null;
}
