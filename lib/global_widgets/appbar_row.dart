import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:pokebag/utils/path_routes.dart';

import '../utils/assets.dart';
import '../utils/colors.dart';

class AppBarRow extends StatelessWidget {
  const AppBarRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                child: const HugeIcon(
                    icon: HugeIcons.strokeRoundedArrowLeft01,
                    color: Colors.white),
              )),
          InkWell(
            onTap: () => context.push(PathRoutes.pokebag),
            child: Container(
              width: 40,
              height: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: MainColor.skyLight,
                  borderRadius: BorderRadius.circular(8)),
              child: Image.asset(Assets.pokeball),
            ),
          ),
        ],
      ),
    );
  }
}
