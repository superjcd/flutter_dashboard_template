import 'package:flutter/material.dart';
import 'package:dashboard_template/router/router.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';

class NavigationTitle extends StatelessWidget {
  const NavigationTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SelectionContainer.disabled(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Visibility(
          visible: ResponsiveBreakpoints.of(context).largerThan(MOBILE),
          child: GestureDetector(
            onTap: () => context.go(routerInitialLocation),
            child: Text(
              'Flutter Admin Dashboard',
              style: theme.textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
