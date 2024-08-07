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
}

final pokeBagLogic = PageLogic();
