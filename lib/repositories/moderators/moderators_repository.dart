import 'package:dio/dio.dart';

import 'moderators.dart';

class ModeratorsRepository extends AbstractModeratorRepository {
  final Dio dio;

  ModeratorsRepository({required this.dio});

  @override
  Future<List<dynamic>> getModeratorsList() async {
    final response = await Dio().get('https://api.vimeworld.com/online/staff');

    List<dynamic> moderators =
        response.data.map((e) => Moderator.fromJson(e)).toList();
    return moderators;
  }
}
