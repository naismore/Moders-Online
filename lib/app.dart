import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class ModeratorsListApp extends StatelessWidget {
  const ModeratorsListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moderators List',
      theme: darkTheme,
      routes: routes,
    );
  }
}
