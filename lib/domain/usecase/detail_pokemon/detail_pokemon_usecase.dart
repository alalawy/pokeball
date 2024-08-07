import 'package:dartz/dartz.dart';
import 'package:pokebag/data/models/detail_pokemon/detail_pokemon_model.dart';

import '../../../../core/error/failures.dart';
import '../../repositories/detail_pokemon/detail_pokemon_repository.dart';

class GetDetailPokemon {
  final DetailPokemonRepository repository;
  GetDetailPokemon(this.repository);

  Future<Either<Failure, DetailPokemonModel>> call(String id) async {
    return await repository.getDetailPokemons(id);
  }
}
