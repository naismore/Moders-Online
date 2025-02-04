import 'package:flutter/material.dart';
import 'package:moderators_list/repositories/moderators/models/models.dart';

import '../widgets/widgets.dart';

class ModeratorScreen extends StatefulWidget {
  const ModeratorScreen({super.key});

  @override
  State<ModeratorScreen> createState() => _ModeratorScreenState();
}

class _ModeratorScreenState extends State<ModeratorScreen> {
  Moderator? moderator;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    assert(
        args != null && args is Moderator, 'You must provide Moderator args');
    moderator = args as Moderator;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(moderator?.name ?? '...')),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InfoCard(
                name: 'Уровень', value: moderator?.level.toString() ?? '0'),
            InfoCard(
              name: 'Время в игре',
              value: ((moderator?.playedSeconds ?? (60 * 60)) / (60 * 60))
                  .toInt()
                  .toString(),
            )
          ],
        ),
      ),
    );
  }
}
