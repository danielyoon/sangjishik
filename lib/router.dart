import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/user_interface/app_scaffold.dart';
import 'package:sangjishik/user_interface/screens/about/about_screen.dart';
import 'package:sangjishik/user_interface/screens/create/create_posts_screen.dart';
import 'package:sangjishik/user_interface/screens/home/home_screen.dart';
import 'package:sangjishik/user_interface/screens/home/home_wrapper.dart';
import 'package:sangjishik/user_interface/screens/home/mobile_login_screen.dart';
import 'package:sangjishik/user_interface/screens/posts/one_post_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  redirect: _handleRedirect,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => AppScaffold(child: HomeWrapper(navigationShell: navigationShell)),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
              routes: const [
                // GoRoute(
                //   name: 'post',
                //   path: 'post/:title',
                //   pageBuilder: (context, GoRouterState state) {
                //     state.pathParameters.forEach((key, value) {
                //       print('Key: $key, Value: $value');
                //     });
                //
                //     return NoTransitionPage(child: OnePostScreen(title: state.pathParameters['title']!));
                //   },
                // ),
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
        StatefulShellBranch(routes: [
          GoRoute(
            path: '/login',
            pageBuilder: (context, state) => NoTransitionPage(
              child: MobileLoginScreen(),
            ),
          ),
        ]),
      ],
    ),
  ],
);

String? _handleRedirect(BuildContext context, GoRouterState state) {
  debugPrint('Navigate to: ${state.location}');
  return null;
}
