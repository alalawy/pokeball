import 'package:dartz/dartz.dart';
import 'package:pokebag/data/models/detail_pokemon/detail_pokemon_model.dart';

import '../../../../core/error/failures.dart';

abstract class DetailPokemonRepository {
  Future<Either<Failure, DetailPokemonModel>> getDetailPokemons(String id);
}
