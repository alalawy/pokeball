import 'package:dartz/dartz.dart';
import 'package:pokebag/data/models/pokemon/pokemon_model.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../domain/repositories/pokemon/pokemon_repository.dart';
import '../../datasource/pokemon/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, PokemonModel>> getPokemons() async {
    try {
      final remoteFeature = await remoteDataSource.getPokemon();
      return Right(remoteFeature);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
