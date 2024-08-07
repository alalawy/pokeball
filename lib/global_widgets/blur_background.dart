import 'package:flutter/material.dart';

class BlurBackground extends StatelessWidget {
  const BlurBackground({
    super.key,
    required this.width,
    required this.dominantColor,
  });

  final double? width;
  final Color? dominantColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width! - 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(width!),
          boxShadow: [BoxShadow(color: dominantColor!, blurRadius: 120)]),
    );
  }
}
