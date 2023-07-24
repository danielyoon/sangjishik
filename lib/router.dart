import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/app_scaffold.dart';
import 'package:sangjishik/user_interface/screens/about/about_screen.dart';
import 'package:sangjishik/user_interface/screens/create/create_posts_screen.dart';
import 'package:sangjishik/user_interface/screens/home/home_screen.dart';
import 'package:sangjishik/user_interface/screens/home/home_wrapper.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  redirect: _handleRedirect,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppScaffold(child: HomeWrapper(navigationShell: navigationShell)),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/about',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: AboutScreen(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/create',
              pageBuilder: (context, state) => NoTransitionPage(
                child: CreatePostsScreen(),
              ),
            ),
          ],
        ),
      ],
    ),
  ],
);

String? _handleRedirect(BuildContext context, GoRouterState state) {
  //TODO: Add redirection away from 'Create' if not logged in
  debugPrint('Navigate to: ${state.location}');
  return null;
}
