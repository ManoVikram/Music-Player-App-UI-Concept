import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';

class MusicCard extends StatelessWidget {
  const MusicCard({
    Key? key,
    required this.currentPage,
    required this.currentPageOffset,
    required this.index,
    required Size size,
    required this.coverImage,
    required this.artist,
    required this.title,
  })  : _size = size,
        super(key: key);

  final int currentPage;
  final double currentPageOffset;
  final int index;
  final Size _size;
  final String coverImage;
  final String artist;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: currentPage == index ? _size.height * 0.85 : _size.height * 0.6,
      width: _size.width * 0.85,
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40.0),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0.0, 3.0),
            blurRadius: 20.0,
            color: Colors.black38,
          ),
        ],
      ),
      child: LayoutBuilder(builder: (context, constraint) {
        print(currentPageOffset);
        print(currentPageOffset.toInt());
        return Stack(
          // crossAxisAlignment: CrossAxisAlignment.center,
          alignment: Alignment.center,
          children: [
            // Song Banner
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: coverImage,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    coverImage,
                  ),
                ),
              ),
            ),
            // Song title, artist and stars
            Positioned(
              top: constraint.maxWidth,
              child: Column(
                children: [
                  const SizedBox(height: 1.5 * defaultPadding),
                  Text(
                    artist,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 24.0,
                    ),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 0.5 * defaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: SvgPicture.asset(
                          "lib/assets/icons/StarThick.svg",
                          height: 24.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: SvgPicture.asset(
                          "lib/assets/icons/StarThick.svg",
                          height: 24.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: SvgPicture.asset(
                          "lib/assets/icons/StarThick.svg",
                          height: 24.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: SvgPicture.asset(
                          "lib/assets/icons/StarLight.svg",
                          height: 24.0,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: SvgPicture.asset(
                          "lib/assets/icons/StarLight.svg",
                          height: 24.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Drag to listen
            Positioned(
              bottom: 0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: index == currentPage
                    ? Column(
                        children: [
                          const Icon(
                            CupertinoIcons.music_note_2,
                            color: Colors.black,
                            size: 32.0,
                          ),
                          const SizedBox(height: 0.5 * defaultPadding),
                          const Text(
                            "DRAG TO LISTEN",
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 0.25 * defaultPadding),
                          SvgPicture.asset(
                            "lib/assets/icons/Expand_down_light.svg",
                            color: Colors.black,
                            height: 36.0,
                          ),
                          const SizedBox(height: defaultPadding),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ],
        );
      }),
    );
  }
}
