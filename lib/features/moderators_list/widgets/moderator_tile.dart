import 'package:flutter/material.dart';
import 'package:moderators_list/repositories/moderators/models/moderator.dart';

class ModeratorTile extends StatelessWidget {
  const ModeratorTile({
    super.key,
    required this.moderator,
  });

  final Moderator moderator;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: Text(
        moderator.name,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        moderator.rank,
        style: theme.textTheme.labelSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/moderator',
          arguments: moderator,
        );
      },
    );
  }
}
