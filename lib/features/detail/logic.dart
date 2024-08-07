import 'dart:developer';

import 'package:pokebag/data/models/detail_pokemon/detail_pokemon_model.dart';
import 'package:pokebag/domain/usecase/detail_pokemon/detail_pokemon_usecase.dart';
import 'package:vein/vein.dart';

enum FeatureState { Initial, Loading, Loaded, Error }

class PageLogic with Notifier {
  final GetDetailPokemon getPokemon;
  FeatureState _state = FeatureState.Initial;
  String? errorMessage;
  DetailPokemonModel? pokemonData;

  FeatureState get state => _state;

  PageLogic({required this.getPokemon});

  Future<void> fetchPokemon(String id) async {
    _state = FeatureState.Loading;
    refresh();

    final result = await getPokemon(id);

    result.fold(
      (failure) {},
      (pokemon) {
        pokemonData = pokemon;
        refresh();
      },
    );
    log(pokemonData.toString());
  }
}
