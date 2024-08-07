import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pokebag/data/models/detail_pokemon/detail_pokemon_model.dart';
import 'package:pokebag/data/models/pokebag/pokebag_model.dart';
import 'package:pokebag/domain/usecase/detail_pokemon/detail_pokemon_usecase.dart';
import 'package:pokebag/global_widgets/buttons.dart';
import 'package:pokebag/global_widgets/text_fields.dart';
import 'package:pokebag/utils/colors.dart';
import 'package:vein/vein.dart';

import '../../utils/text_style.dart.dart';

enum FeatureState { Initial, Loading, Loaded, Error }

class PageLogic with Notifier {
  final GetDetailPokemon getPokemon;
  FeatureState _state = FeatureState.Initial;
  String? errorMessage;
  DetailPokemonModel? pokemonData;
  TextEditingController? nameController = TextEditingController();
  List<PokeBagModel> pokeBagModel = <PokeBagModel>[];
  final box = GetStorage();

  FeatureState get state => _state;

  PageLogic({required this.getPokemon});

  Future<void> fetchPokemon(String id) async {
    _state = FeatureState.Loading;
    refresh();

    final result = await getPokemon(id);

    result.fold(
      (failure) {},
      (pokemon) {
        pokemonData = pokemon;
        refresh();
      },
    );
    log(pokemonData.toString());
  }

  void saveToPokebag(String? id, String? name) {
    pokeBagModel
        .add(PokeBagModel(realName: name, id: id, name: nameController!.text));
    refresh();
    box.write('pokebag', pokeBagModelToJson(pokeBagModel));
  }

  void catchPokemon(context, {String? name, String? id}) {
    math.Random random = math.Random();

    bool randomBool = random.nextBool();
    log(randomBool.toString());
    if (randomBool) {
      showDialog(
        context: context,
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text(
                          "Gotcha!",
                          style: TextStyles().title3(),
                        ),
                        16.h,
                        DefaultTextField(
                          controller: nameController,
                          heading: HugeIcon(
                            icon: HugeIcons.strokeRoundedPokeball,
                            color: MainColor.inkDarker,
                          ),
                          placeholder: 'Your $name name',
                          autofocus: true,
                        ),
                        8.h,
                        FilledButtons(
                            text: 'Save',
                            onPressed: () => saveToPokebag(id, name))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 200,
                child: Card(
                  child: Center(
                    child: Text(
                      "Aargh Try Again!",
                      style: TextStyles().title3(),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
