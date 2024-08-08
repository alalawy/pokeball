import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokebag/global_widgets/buttons.dart';
import 'package:pokebag/features/home/logic.dart';
import 'package:pokebag/service_locator.dart';
import 'package:pokebag/utils/path_routes.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:vein/vein.dart';

import '../../global_widgets/blur_background.dart';
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
            const Row(),
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
              onPressed: () => context.push(PathRoutes.pokebag),
            ),
            20.h,
            const Divider(
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
                  builder: (context, _) {
                    return SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
                      onRefresh: () => logic.onRefresh(),
                      onLoading: () => logic.onLoading(),
                      controller: logic.refreshController,
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                          ),
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(
                              8.0), // padding around the grid
                          itemCount: logic.pokemonData?.results?.length ?? 0,
                          itemBuilder: (context, index) {
                            var data = logic.pokemonData?.results?[index];
                            List<String>? idDatas = data?.url?.split('/');
                            return logic.loading.value
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : PokeCard(
                                    imageUrl:
                                        '${Utils.imageUrl}${idDatas![idDatas.length - 2]}.png',
                                    onTap: () => context.push(
                                        PathRoutes.detailPokemon,
                                        extra: idDatas[idDatas.length - 2]),
                                    name: data?.name,
                                  );
                          }),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
