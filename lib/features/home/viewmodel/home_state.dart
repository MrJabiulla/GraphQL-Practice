import 'package:equatable/equatable.dart';
import '../../../core/models/character.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Character> characters;
  final int locationCount;
  final int episodeCount;

  HomeLoaded({
    required this.characters,
    required this.locationCount,
    required this.episodeCount,
  });

  @override
  List<Object?> get props => [characters, locationCount, episodeCount];
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}