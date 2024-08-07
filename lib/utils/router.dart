import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokebag/features/detail/detail_pokemon_page.dart';

import '../features/home/home_page.dart';
import 'path_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: PathRoutes.root,
  routes: <RouteBase>[
    GoRoute(
        path: PathRoutes.root,
        builder: (BuildContext context, GoRouterState state) {
          return const HomePage();
        }),
    GoRoute(
        path: PathRoutes.detailPokemon,
        builder: (BuildContext context, GoRouterState state) {
          return DetailPokemonPage(
            imageUrl: state.extra!.toString(),
          );
        }),
  ],
);
