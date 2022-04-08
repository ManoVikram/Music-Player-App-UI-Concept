import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../../constants.dart';

class CardBack extends StatelessWidget {
  const CardBack({
    Key? key,
    required Size size,
    required this.detailsTranslateAnimation,
    required this.title,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final Animation detailsTranslateAnimation;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..translate(_size.width - 40)
        ..rotateY(vector.radians(180.0)),
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color.fromARGB(255, 228, 227, 225),
        ),
        clipBehavior: Clip.hardEdge,
        child: Transform.translate(
          offset: Offset(0.0,
              (1 - detailsTranslateAnimation.value) * (_size.width - 200.0)),
          child: Column(
            children: [
              Text(
                title,
                style:const TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: defaultPadding),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum eget nisl quis sem finibus pellentesque. Etiam sit amet odio dictum, feugiat lacus rhoncus, fermentum diam. Nulla facilisi. Vestibulum dolor eros.",
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: defaultPadding),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondaryColor,
                      ),
                      child: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondaryColor,
                      ),
                      child: const Icon(
                        Icons.share_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: secondaryColor,
                      ),
                      child: const Icon(
                        Icons.headphones_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: secondaryColor,
                    ),
                    child: const Icon(
                      Icons.settings_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding),
              const Text(
                "Rate this Album",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: defaultPadding / 2),
              Container(
                height: 40.0,
                width: _size.width * 0.45,
                padding: const EdgeInsets.all(defaultPadding / 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      "lib/assets/icons/StarLight.svg",
                      height: 20.0,
                    ),
                    SvgPicture.asset(
                      "lib/assets/icons/StarLight.svg",
                      height: 20.0,
                    ),
                    SvgPicture.asset(
                      "lib/assets/icons/StarLight.svg",
                      height: 20.0,
                    ),
                    SvgPicture.asset(
                      "lib/assets/icons/StarLight.svg",
                      height: 20.0,
                    ),
                    SvgPicture.asset(
                      "lib/assets/icons/StarLight.svg",
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}