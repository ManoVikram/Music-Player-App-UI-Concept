import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

import '../constants.dart';

import './widgets/player_audio_card.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({
    Key? key,
    required this.coverImage,
    required this.title,
    required this.artist,
  }) : super(key: key);

  final String coverImage;
  final String title;
  final String artist;

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen>
    with SingleTickerProviderStateMixin {
  double sliderValue = 0.0;

  late final AnimationController _animationController;

  late final Animation rotationAnimation;
  late final Animation detailsTranslateAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    rotationAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.7),
    );

    detailsTranslateAnimation = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(
        0.4,
        1.0,
        curve: Curves.decelerate,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            "lib/assets/icons/Logo.svg",
            height: 40.0,
          ),
        ),
        centerTitle: true,
        leadingWidth: 100.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              Icon(
                CupertinoIcons.ellipsis_vertical,
                color: secondaryColor,
                size: 36.0,
              ),
              Text(
                "MENU",
                style: TextStyle(
                  color: secondaryColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset(
              "lib/assets/icons/User.svg",
              height: 36.0,
            ),
          ),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: defaultPadding * 0.5),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                        size: 16.0,
                      ),
                      Text(
                        "BACK",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              GestureDetector(
                onTap: () {
                  if (!_animationController.isCompleted) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                },
                child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform(
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(
                              rotationAnimation.value * vector.radians(180)),
                        alignment: Alignment.center,
                        child: PlayerAudioCard(
                          size: _size,
                          animationController: _animationController,
                          detailsTranslateAnimation: detailsTranslateAnimation,
                          title: widget.title,
                          coverImage: widget.coverImage,
                        ),
                      );
                    }),
              ),
              const SizedBox(height: defaultPadding),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      widget.artist,
                      style: const TextStyle(
                        fontSize: 20.0,
                        height: 0.9,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.favorite_border,
                    size: 28.0,
                  ),
                ],
              ),
              /* SliderTheme(
                data: const SliderThemeData(
                  trackHeight: 2.0,
                ),
                child: Slider(
                  onChanged: (value) {
                    setState(() {
                      sliderValue = value;
                    });
                  },
                  value: sliderValue,
                  thumbColor: Colors.amber,
                  activeColor: Colors.grey[800],
                  inactiveColor: primaryColor.withOpacity(0.5),
                ),
              ), */
              const SizedBox(height: defaultPadding),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    height: 2.0,
                    width: _size.width - defaultPadding,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.5),
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 18.0,
                        width: 18.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[800],
                        ),
                      ),
                      Container(
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber[300],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 0.3),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "00:00",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    "05:24",
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.repeat,
                    color: secondaryColor,
                    size: 30.0,
                  ),
                  const Icon(
                    Icons.fast_rewind_rounded,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                  Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.pause_rounded,
                      color: Colors.white,
                      size: 56.0,
                    ),
                  ),
                  const Icon(
                    Icons.fast_forward_rounded,
                    color: Colors.grey,
                    size: 40.0,
                  ),
                  const Icon(
                    CupertinoIcons.shuffle,
                    color: secondaryColor,
                    size: 30.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
