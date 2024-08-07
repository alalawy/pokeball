import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

// ignore: must_be_immutable
class FilledButtons extends StatelessWidget {
  FilledButtons({super.key, this.onPressed, this.text, this.height});

  VoidCallback? onPressed;
  String? text;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48,
      child: FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(MainColor.primary[500])),
          child: Text(
            text ?? '',
            style: GoogleFonts.inter(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          )),
    );
  }
}

// ignore: must_be_immutable
class OutlinedButtons extends StatelessWidget {
  OutlinedButtons({super.key, this.onPressed, this.text, this.height});

  VoidCallback? onPressed;
  String? text;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 48,
      child: OutlinedButton(
          onPressed: onPressed,
          style: const ButtonStyle(
              side:
                  WidgetStatePropertyAll(BorderSide(color: MainColor.primary))),
          child: Text(
            text ?? '',
            style: GoogleFonts.inter(
              color: MainColor.primary,
              fontSize: 16,
            ),
          )),
    );
  }
}
