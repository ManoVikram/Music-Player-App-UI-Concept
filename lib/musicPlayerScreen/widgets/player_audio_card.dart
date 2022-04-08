import 'package:flutter/material.dart';

import '../../constants.dart';

import './card_back.dart';
import './card_front.dart';

class PlayerAudioCard extends StatelessWidget {
  const PlayerAudioCard({
    Key? key,
    required Size size,
    required AnimationController animationController,
    required this.detailsTranslateAnimation,
    required this.title,
    required this.coverImage,
  })  : _size = size,
        _animationController = animationController,
        super(key: key);

  final Size _size;
  final AnimationController _animationController;
  final Animation detailsTranslateAnimation;
  final String title;
  final String coverImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _size.width - defaultPadding,
      width: _size.width - defaultPadding,
      padding: const EdgeInsets.all(0.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 228, 227, 225),
        borderRadius: BorderRadius.circular(20.0),
      ),
      /* child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: primaryColor,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image.asset(
              "lib/assets/images/05.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ],
      ), */
      child: _animationController.value > 0.35
          ? CardBack(
              size: _size,
              detailsTranslateAnimation: detailsTranslateAnimation,
              title: title,
            )
          : CardFront(
              size: _size,
              coverImage: coverImage,
            ),
    );
  }
}
