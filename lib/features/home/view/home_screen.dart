
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../viewmodel/home_cubit.dart';
import '../viewmodel/home_state.dart';
import '../widgets/character_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final client = GraphQLProvider.of(context).value; // Get client here

    return BlocProvider(
      create: (context) => HomeCubit(client)..fetchHomeData(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Rick and Morty')),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeLoaded) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Locations: ${state.locationCount} | Episodes: ${state.episodeCount}',
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.characters.length,
                      itemBuilder: (context, index) {
                        return CharacterTile(character: state.characters[index]);
                      },
                    ),
                  ),
                ],
              );
            } else if (state is HomeError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}