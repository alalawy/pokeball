import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokebag/data/models/pokebag/pokebag_model.dart';
import 'package:vein/vein.dart';

import '../../../utils/utils.dart';

// ignore: must_be_immutable
class BagCard extends StatefulWidget {
  BagCard({
    required this.pokeBagModel,
    this.onDelete,
    super.key,
  });

  PokeBagModel pokeBagModel;
  VoidCallback? onDelete;

  @override
  State<BagCard> createState() => _BagCardState();
}

class _BagCardState extends State<BagCard> {
  Color? dominantColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      NetworkImage('${Utils.imageUrl}${widget.pokeBagModel.id}.png'),
    );

    setState(() {
      dominantColor =
          paletteGenerator.dominantColor?.color.withAlpha(80) ?? Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: dominantColor),
      child: Stack(
        children: [
          Positioned(
              left: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.pokeBagModel.name}',
                    style: TextStyles().title3(),
                  ),
                  Text(
                    '${widget.pokeBagModel.realName}',
                    style: TextStyles().largeNoneRegular(),
                  ),
                  16.h,
                  InkWell(
                    onTap: widget.onDelete,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: HugeIcon(
                          size: 30,
                          icon: HugeIcons.strokeRoundedDelete04,
                          color: MainColor.primary[400]!),
                    ),
                  )
                ],
              )),
          Positioned(
            right: -20,
            top: -50,
            child: Stack(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                      boxShadow: const [
                        BoxShadow(blurRadius: 100, color: MainColor.skyLight)
                      ]),
                ),
                Image.network(
                  '${Utils.imageUrl}${widget.pokeBagModel.id}.png',
                  width: 200,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
