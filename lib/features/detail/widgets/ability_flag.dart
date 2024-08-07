import 'package:flutter/material.dart';

class AbilityFlag extends StatelessWidget {
  const AbilityFlag(
      {super.key, required this.dominantColor, required this.name});

  final Color? dominantColor;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: dominantColor!, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('$name'),
      ),
    );
  }
}
