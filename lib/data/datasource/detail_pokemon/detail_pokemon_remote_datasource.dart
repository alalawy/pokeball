import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokebag/utils/utils.dart';

import '../../../../../core/error/exceptions.dart';
import '../../models/detail_pokemon/detail_pokemon_model.dart';

abstract class DetailPokemonRemoteDataSource {
  Future<DetailPokemonModel> getDetailPokemon(String id);
}

class DetailPokemonRemoteDataSourceImpl
    implements DetailPokemonRemoteDataSource {
  final http.Client client;

  DetailPokemonRemoteDataSourceImpl({required this.client});

  @override
  Future<DetailPokemonModel> getDetailPokemon(String id) async {
    final response = await client.get(
      Uri.parse('${Utils.baseUrl}/pokemon/$id'),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return DetailPokemonModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
