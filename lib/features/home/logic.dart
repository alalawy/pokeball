import 'dart:developer';

import 'package:pokebag/domain/usecase/pokemon/pokemon_usecase.dart';
import 'package:vein/vein.dart';

import '../../data/models/pokemon/pokemon_model.dart';

enum FeatureState { Initial, Loading, Loaded, Error }

class PageLogic with Notifier {
  final GetPokemon getPokemon;
  FeatureState _state = FeatureState.Initial;
  String? errorMessage;
  PokemonModel? pokemonData;

  FeatureState get state => _state;

  PageLogic({required this.getPokemon});

  Future<void> fetchPokemon() async {
    _state = FeatureState.Loading;
    refresh();

    final result = await getPokemon();

    result.fold(
      (failure) {},
      (pokemon) {
        pokemonData = pokemon;
        refresh();
      },
    );
  }
}
