import 'package:dartz/dartz.dart';
import 'package:pokebag/data/models/pokemon/pokemon_model.dart';

import '../../../../core/error/failures.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonModel>> getPokemons(int limit);
}
