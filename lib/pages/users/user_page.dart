import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:dashboard_template/models/index.dart';
import 'package:dashboard_template/widgets/widgets.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user.name,
            style: theme.textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text('role: ${user.role}'),
          Text('userId: ${user.userId}'),
          const Gap(16),
          ElevatedButton.icon(
            icon: const Icon(Icons.navigate_before),
            label: const Text('Back'),
            onPressed: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
