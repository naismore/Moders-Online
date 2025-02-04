import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moderators_list/features/moderators_list/bloc/moderators_list_bloc.dart';

import '../../../repositories/moderators/moderators.dart';
import '../widgets/widgets.dart';

class ModeratorsListScreen extends StatefulWidget {
  const ModeratorsListScreen({super.key, required this.title});

  final String title;

  @override
  State<ModeratorsListScreen> createState() => _ModeratorsListScreenState();
}

class _ModeratorsListScreenState extends State<ModeratorsListScreen> {
  final _moderatorsListBloc = ModeratorsListBloc(
    GetIt.I<AbstractModeratorRepository>(),
  );

  @override
  void initState() {
    _moderatorsListBloc.add(LoadModeratorsList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _moderatorsListBloc.add(LoadModeratorsList());
        },
        child: BlocBuilder<ModeratorsListBloc, ModeratorsListState>(
          bloc: _moderatorsListBloc,
          builder: (context, state) {
            if (state is ModeratorsListLoaded) {
              return ListView.separated(
                padding: const EdgeInsets.only(top: 16),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: state.moderatorsList.length,
                itemBuilder: (context, index) {
                  final moderator = state.moderatorsList[index] as Moderator;
                  return ModeratorTile(moderator: moderator);
                },
              );
            }
            if (state is ModeratorsListFailure) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Something went wrong',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                    onPressed: () {
                      _moderatorsListBloc.add(LoadModeratorsList());
                    },
                    child: const Text('Try again'),
                  ),
                ],
              ));
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
