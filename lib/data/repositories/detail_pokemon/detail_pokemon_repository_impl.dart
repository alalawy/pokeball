import 'package:dartz/dartz.dart';
import 'package:pokebag/data/models/detail_pokemon/detail_pokemon_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../domain/repositories/detail_pokemon/detail_pokemon_repository.dart';
import '../../datasource/detail_pokemon/detail_pokemon_remote_datasource.dart';

class DetailPokemonRepositoryImpl implements DetailPokemonRepository {
  final DetailPokemonRemoteDataSource remoteDataSource;

  DetailPokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, DetailPokemonModel>> getDetailPokemons(id) async {
    try {
      final remoteFeature = await remoteDataSource.getDetailPokemon(id);
      return Right(remoteFeature);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
