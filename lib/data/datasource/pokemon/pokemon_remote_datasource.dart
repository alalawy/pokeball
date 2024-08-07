import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokebag/utils/utils.dart';

import '../../../../../core/error/exceptions.dart';
import '../../models/pokemon/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonModel> getPokemon();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<PokemonModel> getPokemon() async {
    final response = await client.get(
      Uri.parse('${Utils.baseUrl}/pokemon'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
