import 'package:sangjishik/controller/utils/string_utils.dart';
import 'package:sangjishik/core_packages.dart';
import 'package:sangjishik/ui/app_scaffold.dart';
import 'package:sangjishik/ui/screens/about/about_screen.dart';
import 'package:sangjishik/ui/screens/create/create_posts_screen.dart';
import 'package:sangjishik/ui/screens/home/home_screen.dart';
import 'package:sangjishik/ui/screens/home/home_wrapper.dart';
import 'package:sangjishik/ui/screens/home/mobile_login_screen.dart';
import 'package:sangjishik/ui/screens/posts/post_screen.dart';
import 'package:sangjishik/controller/models/post.dart';

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
              routes: [
                GoRoute(
                  path: 'post/:title',
                  pageBuilder: (context, state) {
                    final title = state.pathParameters['title'];

                    Post post = posts.posts
                        .firstWhere((element) => element.title == StringUtils.replaceHyphensWithSpaces(title!));
                    return NoTransitionPage(
                      child: PostScreen(post: post),
                    );
                  },
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
  bool isAdmin = auth.isAdmin;
  double width = context.widthPx;

  if (state.location == '/create' && !isAdmin) return '/';
  if (state.location == '/login' && width > 799) return '/';

  debugPrint('Navigate to: ${state.location}');
  return null;
}
