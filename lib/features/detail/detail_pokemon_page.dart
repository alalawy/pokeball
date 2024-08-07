import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokebag/features/detail/widgets/swipe_pokeball.dart';
import 'package:pokebag/utils/assets.dart';
import 'package:pokebag/utils/colors.dart';
import 'package:vein/vein.dart';

class DetailPokemonPage extends StatefulWidget {
  DetailPokemonPage({super.key, this.imageUrl});
  String? imageUrl;

  @override
  State<DetailPokemonPage> createState() => _DetailPokemonPageState();
}

class _DetailPokemonPageState extends State<DetailPokemonPage> {
  Color? dominantColor;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage(widget.imageUrl!),
    );

    setState(() {
      dominantColor =
          paletteGenerator.dominantColor?.color.withOpacity(.4) ?? Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    double? width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          OverflowBox(
            maxWidth: double.infinity,
            child: Text(
              'Poke Name',
              style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: MainColor.inkDarker.withOpacity(.5)),
            ),
          ),
          Container(
            width: width,
            height: width - 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width),
                boxShadow: [BoxShadow(color: dominantColor!, blurRadius: 120)]),
          ),
          Image.network(
            width: width * 2,
            height: width * 1.3,
            widget.imageUrl!,
            fit: BoxFit.cover,
          ),
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 150,
                child: SwipeUpPokeball(),
              ),
              50.h,
            ],
          )
        ],
      ),
    );
  }
}
