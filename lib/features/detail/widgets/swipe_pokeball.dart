import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:pokebag/features/detail/logic.dart';
import 'package:pokebag/service_locator.dart';
import 'package:pokebag/utils/utils.dart';

// ignore: must_be_immutable
class SwipeUpPokeball extends StatefulWidget {
  String? oggUrl;
  String? name;
  String? id;
  SwipeUpPokeball({super.key, this.oggUrl, this.id, this.name});
  @override
  // ignore: library_private_types_in_public_api
  _SwipeUpPokeballState createState() => _SwipeUpPokeballState();
}

class _SwipeUpPokeballState extends State<SwipeUpPokeball>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controllerInit;
  late Animation<double> _animation;
  late Animation<double> _animationInit;

  final player = AudioPlayer(); // Create a player
  final logic = locator<PageLogic>();
  @override
  void initState() {
    super.initState();
    _controllerInit = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _animationInit = Tween<double>(begin: 0, end: -30).animate(CurvedAnimation(
      parent: _controllerInit,
      curve: Curves.easeInOut,
    ));

    _animation = Tween<double>(begin: 0, end: -200).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controllerInit.forward();
    _controllerInit.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerInit.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controllerInit.forward();
      }
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
        logic.catchPokemon(context, id: widget.id, name: widget.name);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerInit.dispose();
    super.dispose();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) async {
    if (details.primaryDelta! < -10) {
      // Schemes: (https: | file: | asset: )

      _controllerInit.stop();
      _controller.forward();

      if (Platform.isAndroid) {
        await player.setUrl(// Load a URL
            widget.oggUrl!);
        player.play();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Positioned(
          bottom: 70,
          child: AnimatedBuilder(
              animation: _animationInit,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animationInit.value),
                  child: const Column(
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_up),
                      Icon(Icons.keyboard_arrow_up),
                      Icon(Icons.keyboard_arrow_up),
                    ],
                  ),
                );
              }),
        ),
        Positioned(
          bottom: 25,
          child: GestureDetector(
            onVerticalDragUpdate: _onVerticalDragUpdate,
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                );
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(Assets.pokeball),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Positioned(
          bottom: 0,
          child: Text(
            'Swipe up to catch',
          ),
        ),
      ],
    );
  }
}
