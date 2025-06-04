import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../../../core/models/character.dart';
import '../../../core/models/location_info.dart';
import '../../../core/models/episode_info.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GraphQLClient client;
  HomeCubit(this.client) : super(HomeInitial());

  final String query = """
    query {
      characters {
        results{
          id
          name
          gender
          species
          status
          image
        }
      }
      locations {
        info {
          count
        }
      }
      episodes {
        info {
          count
        }
      }
    }
  """;

  Future<void> fetchHomeData() async {
    emit(HomeLoading());
    try {
      final result = await client.query(QueryOptions(document: gql(query)));
      if (result.hasException) {
        emit(HomeError(result.exception.toString()));
        return;
      }
      final charJson = result.data?['characters']['results'] as List<dynamic>;
      final characters = charJson.map((e) => Character.fromJson(e)).toList();

      final locationsInfo = LocationInfo.fromJson(result.data?['locations']['info']);
      final episodesInfo = EpisodeInfo.fromJson(result.data?['episodes']['info']);

      emit(HomeLoaded(
        characters: characters,
        locationCount: locationsInfo.count,
        episodeCount: episodesInfo.count,
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}