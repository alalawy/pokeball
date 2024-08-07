import 'package:flutter/material.dart';
import 'package:pokebag/utils/utils.dart';

class SwipeUpPokeball extends StatefulWidget {
  @override
  _SwipeUpPokeballState createState() => _SwipeUpPokeballState();
}

class _SwipeUpPokeballState extends State<SwipeUpPokeball>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controllerInit;
  late Animation<double> _animation;
  late Animation<double> _animationInit;

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
      } else if (status == AnimationStatus.dismissed) {
        _controllerInit.forward();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerInit.dispose();
    super.dispose();
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    if (details.primaryDelta! < -10) {
      _controllerInit.stop();
      _controller.forward();
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
                  child: Column(
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
                decoration: BoxDecoration(
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
        Positioned(
          bottom: 0,
          child: Text(
            'Swipe up to catch',
          ),
        ),
      ],
    );
  }
}
