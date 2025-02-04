import '../features/moderator/moderator.dart';
import '../features/moderators_list/moderator_list.dart';

final routes = {
  '/': (context) => ModeratorsListScreen(title: "Moderators List"),
  '/moderator': (context) => ModeratorScreen(),
};
