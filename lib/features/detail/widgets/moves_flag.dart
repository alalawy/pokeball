import 'package:flutter/material.dart';

class MovesFlag extends StatelessWidget {
  const MovesFlag({super.key, required this.dominantColor, required this.name});

  final Color? dominantColor;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: dominantColor),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('$name'),
      ),
    );
  }
}
