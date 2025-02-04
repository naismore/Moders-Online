import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moderators_list/repositories/moderators/moderators.dart';

part 'moderators_list_state.dart';
part 'moderator_list_event.dart';

class ModeratorsListBloc
    extends Bloc<ModeratorsListEvent, ModeratorsListState> {
  ModeratorsListBloc(this.moderatorRepository)
      : super(ModeratorsListInitial()) {
    on<LoadModeratorsList>((event, emit) async {
      try {
        if (state is! ModeratorsListLoaded) {
          emit(ModeratorsListLoading());
        }
        final moderatorsList = await moderatorRepository.getModeratorsList();
        emit(ModeratorsListLoaded(moderatorsList: moderatorsList));
      } catch (e) {
        emit(ModeratorsListFailure(exception: e));
      }
    });
  }

  final AbstractModeratorRepository moderatorRepository;
}
