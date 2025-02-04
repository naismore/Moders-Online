part of 'moderators_list_bloc.dart';

abstract class ModeratorsListState extends Equatable {}

class ModeratorsListInitial extends ModeratorsListState {
  @override
  List<Object?> get props => [];
}

class ModeratorsListLoading extends ModeratorsListState {
  @override
  List<Object?> get props => [];
}

class ModeratorsListLoaded extends ModeratorsListState {
  final List<dynamic> moderatorsList;

  ModeratorsListLoaded({
    required this.moderatorsList,
  });

  @override
  List<Object?> get props => [moderatorsList];
}

class ModeratorsListFailure extends ModeratorsListState {
  final Object? exception;

  ModeratorsListFailure({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}
