import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokebag/features/detail/logic.dart';
import 'package:pokebag/features/detail/widgets/moves_flag.dart';
import 'package:pokebag/features/detail/widgets/swipe_pokeball.dart';
import 'package:pokebag/service_locator.dart';
import 'package:pokebag/utils/utils.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vein/vein.dart';

import '../../global_widgets/appbar_row.dart';
import '../../global_widgets/blur_background.dart';
import 'widgets/ability_flag.dart';

// ignore: must_be_immutable
class DetailPokemonPage extends StatefulWidget {
  DetailPokemonPage({super.key, this.id});
  String? id;

  @override
  State<DetailPokemonPage> createState() => _DetailPokemonPageState();
}

class _DetailPokemonPageState extends State<DetailPokemonPage> {
  Color? dominantColor;
  String? imageUrl;
  final logic = locator<PageLogic>();

  @override
  void initState() {
    imageUrl = '${Utils.imageUrl}${widget.id}.png';
    super.initState();
    _updatePalette();
    logic.fetchPokemon(widget.id ?? '');
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage(imageUrl!),
    );

    setState(() {
      dominantColor = paletteGenerator.dominantColor?.color ?? Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.of(context).size.width;
    double? height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: VeinBuilder(
          logic: logic,
          builder: (context, _) {
            var data = logic.pokemonData;
            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Skeletonizer(
                  enabled: data == null ? true : false,
                  child: OverflowBox(
                    maxWidth: double.infinity,
                    child: Text(
                      '${data?.forms?.first.name}',
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: MainColor.inkLighter.withOpacity(.4)),
                    ),
                  ),
                ),
                Skeletonizer(
                    enabled: data == null ? true : false,
                    child: BlurBackground(
                        width: width, dominantColor: dominantColor)),
                Skeletonizer(
                  enabled: data == null ? true : false,
                  child: Image.network(
                    width: width * 2,
                    height: width * 1.3,
                    imageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                const AppBarRow(),
                Skeletonizer(
                  enabled: data == null ? true : false,
                  child: Column(
                    children: [
                      (height * .48).h,
                      SizedBox(
                        height: 35,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: data?.types?.length ?? 0,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: MovesFlag(
                              dominantColor: dominantColor,
                              name: data?.types?[index].type?.name,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${data?.forms?.first.name}',
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: data?.abilities?.length ?? 0,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: AbilityFlag(
                              dominantColor: dominantColor!.withOpacity(.4),
                              name: data?.abilities?[index].ability?.name,
                            ),
                          ),
                        ),
                      ),
                      20.h,
                      Text(
                        'Moves',
                        style: TextStyles().title3(),
                      ),
                      16.h,
                      SizedBox(
                        height: 38,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: data?.moves?.length ?? 0,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Center(
                              child: MovesFlag(
                                dominantColor: dominantColor!.withOpacity(.4),
                                name: data?.moves?[index].move?.name,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 150,
                      child: SwipeUpPokeball(
                        oggUrl: data?.cries?.latest,
                        id: widget.id,
                        name: data?.forms?.first.name,
                      ),
                    ),
                    50.h,
                  ],
                )
              ],
            );
          }),
    );
  }
}
