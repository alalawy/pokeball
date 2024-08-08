import 'package:dartz/dartz.dart';
import 'package:pokebag/data/models/pokemon/pokemon_model.dart';

import '../../../../core/error/failures.dart';
import '../../repositories/pokemon/pokemon_repository.dart';

class GetPokemon {
  final PokemonRepository repository;

  GetPokemon(this.repository);

  Future<Either<Failure, PokemonModel>> call(int limit) async {
    return await repository.getPokemons(limit);
  }
}
