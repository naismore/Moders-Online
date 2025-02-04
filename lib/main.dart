import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moderators_list/app.dart';
import 'package:moderators_list/repositories/moderators/moderators.dart';

void main() {
  GetIt.I.registerLazySingleton<AbstractModeratorRepository>(
    () => ModeratorsRepository(dio: Dio()),
  );
  runApp(const ModeratorsListApp());
}
