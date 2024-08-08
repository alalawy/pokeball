import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:pokebag/data/models/pokebag/pokebag_model.dart';
import 'package:vein/vein.dart';

class PageLogic with Notifier {
  List<PokeBagModel> pokeBagModels = <PokeBagModel>[];
  final box = GetStorage();
  void loadPokeBag() {
    pokeBagModels = pokeBagModelFromJson(box.read('pokebag'));
    refresh();
  }

  void deletePoke(PokeBagModel data) {
    log('delete');
    pokeBagModels.remove(data);
    refresh();
    log(pokeBagModelToJson(pokeBagModels).toString());
    saveToBag();
  }

  void saveToBag() {
    box.write('pokebag', pokeBagModelToJson(pokeBagModels));
  }
}

final pokeBagLogic = PageLogic();
