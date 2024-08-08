import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:vein/vein.dart';

import '../../../utils/text_style.dart.dart';

// ignore: must_be_immutable
class PokeCard extends StatefulWidget {
  PokeCard({
    required this.imageUrl,
    this.name,
    this.onTap,
    super.key,
  });

  String? imageUrl;
  String? name;
  VoidCallback? onTap;

  @override
  State<PokeCard> createState() => _PokeCardState();
}

class _PokeCardState extends State<PokeCard> {
  Color? dominantColor = Colors.black;

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
          paletteGenerator.dominantColor?.color.withAlpha(80) ?? Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Skeletonizer(
        enabled: widget.name == null ? true : false,
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
                      color: dominantColor!.withOpacity(.5),
                      border: Border.all(color: dominantColor!, width: 2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "${widget.name}",
                        textAlign: TextAlign.center,
                        style: TextStyles().regularNoneSuperBold(),
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
      ),
    );
  }
}
