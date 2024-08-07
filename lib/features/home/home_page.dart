import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokebag/global_widgets/buttons.dart';
import 'package:pokebag/features/home/logic.dart';
import 'package:pokebag/service_locator.dart';
import 'package:pokebag/utils/colors.dart';
import 'package:pokebag/utils/path_routes.dart';
import 'package:vein/vein.dart';

import '../../global_widgets/blur_background.dart';
import '../../utils/assets.dart';
import '../../utils/text_style.dart.dart';
import '../../utils/utils.dart';
import 'widgets/poke_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final logic = locator<PageLogic>();

  @override
  Widget build(BuildContext context) {
    logic.fetchPokemon();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(),
            50.h,
            Text(
              "Battleground",
              style: TextStyles().title3(),
            ),
            30.h,
            SizedBox(
              height: 200,
              child: Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  BlurBackground(
                      width: double.infinity,
                      dominantColor: Colors.red.withOpacity(.4)),
                  Image.asset(
                    Assets.pokeball,
                    width: MediaQuery.of(context).size.width * .5,
                  ),
                ],
              ),
            ),
            20.h,
            FilledButtons(
              text: 'PokeBag',
            ),
            20.h,
            Divider(
              thickness: 2,
            ),
            10.h,
            Text(
              "Pokedex",
              style: TextStyles().title3(),
            ),
            10.h,
            Expanded(
              child: VeinBuilder(
                  logic: logic,
                  builder: (context, _child) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                        ),
                        padding: EdgeInsets.all(8.0), // padding around the grid
                        itemCount: logic.pokemonData?.results?.length ?? 0,
                        itemBuilder: (context, index) {
                          var _data = logic.pokemonData?.results?[index];
                          List<String>? idDatas = _data?.url?.split('/');

                          return PokeCard(
                            imageUrl:
                                '${Utils.imageUrl}${idDatas![idDatas.length - 2]}.png',
                            onTap: () => context.push(PathRoutes.detailPokemon,
                                extra: idDatas[idDatas.length - 2]),
                            name: _data?.name,
                          );
                        });
                  }),
            )
          ],
        ),
      ),
    );
  }
}
