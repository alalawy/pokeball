import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pokebag/features/pokebag/logic.dart';
import 'package:pokebag/global_widgets/appbar_row.dart';
import 'package:pokebag/utils/colors.dart';
import 'package:pokebag/utils/utils.dart';
import 'package:vein/vein.dart';

import '../../utils/assets.dart';
import 'widgets/bag_card.dart';

class Pokebag extends StatelessWidget {
  const Pokebag({super.key});

  @override
  Widget build(BuildContext context) {
    pokeBagLogic.loadPokeBag();
    return Scaffold(
      body: VeinBuilder(
          logic: pokeBagLogic,
          builder: (context, _) {
            return Stack(
              children: [
                Positioned(
                  left: -200,
                  top: 150,
                  child: HugeIcon(
                      size: 500,
                      icon: HugeIcons.strokeRoundedPokeball,
                      color: MainColor.inkLighter.withOpacity(.3)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 200, left: 120),
                  child: ListWheelScrollView(
                    itemExtent: 200,
                    offAxisFraction: -1.5,
                    controller: ScrollController(
                        initialScrollOffset:
                            ((pokeBagLogic.pokeBagModels.length / 2) * 130)),
                    children:
                        pokeBagLogic.pokeBagModels.map<Widget>((pokeBagModel) {
                      return BagCard(
                        pokeBagModel: pokeBagModel,
                        onDelete: () => pokeBagLogic.deletePoke(pokeBagModel),
                      );
                    }).toList(),
                  ),
                ),
                AppBarRow(),
                Padding(
                  padding: const EdgeInsets.only(top: 150, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your',
                        style: TextStyles().title3(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Pokémon',
                            style: TextStyles().title2(),
                          ),
                          8.w,
                          Image.asset(
                            Assets.pokeball,
                            width: 30,
                          )
                        ],
                      ),
                      Spacer(),
                      Text(
                        "${pokeBagLogic.pokeBagModels.length} Pokémon\nin Your\nPokebag",
                        style: TextStyles().regularNormalRegular(),
                      ),
                      100.h
                    ],
                  ),
                )
              ],
            );
          }),
    );
  }
}
