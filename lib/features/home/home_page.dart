import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokebag/global_widgets/buttons.dart';
import 'package:pokebag/features/home/logic.dart';
import 'package:pokebag/utils/colors.dart';
import 'package:pokebag/utils/path_routes.dart';
import 'package:vein/vein.dart';

import '../../global_widgets/blur_background.dart';
import '../../utils/assets.dart';
import '../../utils/text_style.dart.dart';
import 'widgets/poke_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                padding: EdgeInsets.all(8.0), // padding around the grid
                itemCount: homeLogic.pokemon.length,
                itemBuilder: (context, index) => PokeCard(
                  imageUrl: homeLogic.pokemon[index],
                  onTap: () => context.push(PathRoutes.detailPokemon,
                      extra: homeLogic.pokemon[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
