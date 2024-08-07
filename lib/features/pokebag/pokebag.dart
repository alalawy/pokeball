import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pokebag/features/pokebag/logic.dart';
import 'package:pokebag/utils/colors.dart';
import 'package:vein/vein.dart';

import '../../utils/assets.dart';

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
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () => context.pop(),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: MainColor.inkLighter,
                                borderRadius: BorderRadius.circular(8)),
                            child: HugeIcon(
                                icon: HugeIcons.strokeRoundedArrowLeft01,
                                color: Colors.white),
                          )),
                      InkWell(
                        onTap: () => context.pop(),
                        child: Container(
                          width: 40,
                          height: 40,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: MainColor.skyLight,
                              borderRadius: BorderRadius.circular(8)),
                          child: Image.asset(Assets.pokeball),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: -200,
                  child: HugeIcon(
                      size: 500,
                      icon: HugeIcons.strokeRoundedPokeball,
                      color: MainColor.inkLighter.withOpacity(.3)),
                ),
                ListView.builder(
                  itemCount: pokeBagLogic.pokeBagModels.length,
                  itemBuilder: (context, index) =>
                      Text('${pokeBagLogic.pokeBagModels[index].realName}'),
                ),
              ],
            );
          }),
    );
  }
}
