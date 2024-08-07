import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:pokebag/data/datasource/detail_pokemon/detail_pokemon_remote_datasource.dart';
import 'package:pokebag/data/datasource/pokemon/pokemon_remote_datasource.dart';
import 'package:pokebag/data/repositories/detail_pokemon/detail_pokemon_repository_impl.dart';
import 'package:pokebag/data/repositories/pokemon/pokemon_repository_impl.dart';
import 'package:pokebag/domain/repositories/detail_pokemon/detail_pokemon_repository.dart';
import 'package:pokebag/domain/repositories/pokemon/pokemon_repository.dart';
import 'package:pokebag/domain/usecase/detail_pokemon/detail_pokemon_usecase.dart';
import 'package:pokebag/domain/usecase/pokemon/pokemon_usecase.dart';
import 'package:pokebag/features/home/logic.dart' as home_logic;
import 'package:pokebag/features/detail/logic.dart' as detail_logic;

final locator = GetIt.instance;

void setupLocator() {
  // Register HTTP client
  locator.registerLazySingleton(() => http.Client());

// ============  POKEMON ===========
  // Data sources
  locator.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(client: locator()),
  );

  // Repositories
  locator.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(remoteDataSource: locator()),
  );

  //  Use cases
  locator.registerLazySingleton(() => GetPokemon(locator()));

  //  Notifiers
  locator.registerFactory(() => home_logic.PageLogic(getPokemon: locator()));

// ============ DETAIL POKEMON ===========

  // Data sources
  locator.registerLazySingleton<DetailPokemonRemoteDataSource>(
    () => DetailPokemonRemoteDataSourceImpl(client: locator()),
  );

  // Repositories
  locator.registerLazySingleton<DetailPokemonRepository>(
    () => DetailPokemonRepositoryImpl(remoteDataSource: locator()),
  );

  //  Use cases
  locator.registerLazySingleton(() => GetDetailPokemon(locator()));

  //  Notifiers
  locator.registerFactory(() => detail_logic.PageLogic(getPokemon: locator()));
}
