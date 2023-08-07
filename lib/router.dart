import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/app_scaffold.dart';
import 'package:sangjishik/user_interface/screens/about/about_screen.dart';
import 'package:sangjishik/user_interface/screens/create/create_posts_screen.dart';
import 'package:sangjishik/user_interface/screens/home/home_screen.dart';
import 'package:sangjishik/user_interface/screens/home/home_wrapper.dart';
import 'package:sangjishik/user_interface/screens/posts/post_screen.dart';

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
              routes: [
                GoRoute(
                  name: 'post',
                  path: 'post/:id',
                  pageBuilder: (context, GoRouterState state) => NoTransitionPage(
                    child: PostScreen(id: state.pathParameters['id']!),
                  ),
                ),
              ],
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
  //TODO: Create 'does not exist' page
  debugPrint('Navigate to: ${state.location}');
  return null;
}
