import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dashboard_template/layout/scaffold_with_navigation.dart';
import 'package:dashboard_template/pages/login/login_page.dart';
import 'package:dashboard_template/pages/dashboard/dashbord_page.dart';
import 'package:dashboard_template/pages/users/dummy_users.dart';
import 'package:dashboard_template/pages/users/user_page.dart';
import 'package:dashboard_template/pages/users/users_page.dart';
import 'package:dashboard_template/pages/users/user_not_found_page.dart';

part 'router.g.dart';

const routerInitialLocation = '/';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();


final router = GoRouter(
  routes: $appRoutes,
  debugLogDiagnostics: kDebugMode,
  initialLocation: routerInitialLocation, 
  navigatorKey: rootNavigatorKey,
  redirect: (context, state) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    if (token == "" || token == null) {
      return "/login";
    }else {
      return null;
    }
  },
);



@TypedStatefulShellRoute<ShellRouteData>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<DashboardRoute>(
          path: routerInitialLocation,
        ),
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<UsersPageRoute>(
          path: '/users',
          routes: [
            TypedGoRoute<UserPageRoute>(
              path: ':userId',
            ),
          ],
        ),
      ],
    ),
  ],
)

class ShellRouteData extends StatefulShellRouteData {
  const ShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return SelectionArea(
      child: ScaffoldWithNavigation(
        navigationShell: navigationShell,
      ),
    );
  }
}



class DashboardRoute extends GoRouteData {
  const DashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashBoardPage();
  }
}

class UsersPageRoute extends GoRouteData {
  const UsersPageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const UsersPage();
  }
}

class UserPageRoute extends GoRouteData {
  const UserPageRoute({required this.userId});

  final String userId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final user = dummyUsers.firstWhereOrNull((e) => e.userId == userId);
    return user == null
        ? UserNotFoundPage(userId: userId)
        : UserPage(user: user);
  }
}




@TypedGoRoute<LoginRoute>(
  path:LoginRoute.path,
)


class LoginRoute extends GoRouteData {
    const LoginRoute();
    
    static const path = '/login';

    @override
    Widget build(BuildContext context, GoRouterState state) {
      return const Login();
    }
    
}
