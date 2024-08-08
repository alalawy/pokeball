import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pokebag/domain/usecase/pokemon/pokemon_usecase.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:vein/vein.dart';

import '../../data/models/pokemon/pokemon_model.dart';

enum FeatureState { Initial, Loading, Loaded, Error }

class PageLogic with Notifier {
  final GetPokemon getPokemon;
  FeatureState _state = FeatureState.Initial;
  String? errorMessage;
  PokemonModel? pokemonData;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  FeatureState get state => _state;
  PageLogic({required this.getPokemon});

  var loading = false.spec;

  var limit = 20.spec;

  Future<void> fetchPokemon() async {
    _state = FeatureState.Loading;
    refresh();

    final result = await getPokemon(limit.value);

    result.fold(
      (failure) {},
      (pokemon) {
        pokemonData = pokemon;
        refresh();
      },
    );
  }

  void onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    reload();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    loadMore();
    refreshController.loadComplete();
  }

  Future<void> loadMore() async {
    loading.value = true;
    refresh();
    limit.value = limit.value + 20;
    fetchPokemon();

    loading.value = false;
    refresh();
  }

  Future<void> reload() async {
    loading.value = true;
    refresh();
    limit.value = 20;
    fetchPokemon();

    loading.value = false;
    refresh();
  }
}
