import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:vein/vein.dart';

import '../../../utils/colors.dart';
import '../../../utils/text_style.dart.dart';

class PokeCard extends StatefulWidget {
  PokeCard({
    required this.imageUrl,
    this.onTap,
    super.key,
  });

  String? imageUrl;
  VoidCallback? onTap;

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  Color? darkVibrantColor;
  Color? lightVibrantColor;

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
      darkVibrantColor = paletteGenerator.vibrantColor?.color ?? Colors.black;
      lightVibrantColor =
          paletteGenerator.lightVibrantColor?.color.withAlpha(80) ??
              Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: lightVibrantColor,
                    border: Border.all(color: darkVibrantColor!, width: 2)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Poke Name ",
                      textAlign: TextAlign.center,
                      style: TextStyles()
                          .regularNoneSuperBold()
                          .copyWith(color: darkVibrantColor!),
                    ),
                    25.h
                  ],
                ),
              ),
            ),
            Positioned(
              top: -20,
              left: -10,
              child: Image.network(
                widget.imageUrl!,
                width: 200,
                height: 150,
                fit: BoxFit.fill,
              ),
            )
          ],
        ),
      ),
    );
  }
}
