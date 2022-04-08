import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

import '../musicPlayerScreen/music_player_screen.dart';
import './widgets/music_card.dart';
import '../models/music.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;

  int currentPage = 0;
  double currentPageOffset = 0.0;
  double dragOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7);
    _pageController.addListener(() {
      setState(() {
        currentPageOffset = _pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
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
        backgroundColor: primaryColor,
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SizedBox(
              height: _size.height * 0.72,
              width: double.infinity,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                physics: const BouncingScrollPhysics(),
                pageSnapping: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Align(
                    alignment: Alignment.topCenter,
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: defaultPadding, top: 2 * defaultPadding),
                        child: GestureDetector(
                          onVerticalDragStart: (details) {
                            // print(details.localPosition);
                          },
                          onVerticalDragUpdate: (details) {
                            // print(details.delta);
                          },
                          onVerticalDragEnd: (details) {
                            // print(details.primaryVelocity);
                          },
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MusicPlayerScreen(
                                  artist: allMusic[index].artist,
                                  coverImage: allMusic[index].coverImage,
                                  title: allMusic[index].title,
                                ),
                              ),
                            );
                          },
                          child: MusicCard(
                            currentPage: currentPage,
                            currentPageOffset: currentPageOffset,
                            size: _size,
                            index: index,
                            coverImage: allMusic[index].coverImage,
                            artist: allMusic[index].artist,
                            title: allMusic[index].title,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Positioned(
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 0.5 * defaultPadding),
                  const Padding(
                    padding: EdgeInsets.only(left: defaultPadding),
                    child: Text(
                      "Genres",
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 0.25 * defaultPadding),
                  SizedBox(
                    width: _size.width,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: const [
                          SizedBox(width: defaultPadding),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Chip(
                              label: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 6.0,
                                ),
                                child: Text(
                                  "Indie Rock",
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              backgroundColor: secondaryColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Chip(
                              label: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 6.0,
                                ),
                                child: Text(
                                  "Pop",
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              backgroundColor: primaryColor,
                              side: BorderSide(color: secondaryColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Chip(
                              label: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 6.0,
                                ),
                                child: Text(
                                  "Reggage",
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              backgroundColor: primaryColor,
                              side: BorderSide(color: secondaryColor),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Chip(
                              label: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 6.0,
                                ),
                                child: Text(
                                  "Melody",
                                  style: TextStyle(
                                    color: secondaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              backgroundColor: primaryColor,
                              side: BorderSide(color: secondaryColor),
                            ),
                          ),
                          SizedBox(width: defaultPadding)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
