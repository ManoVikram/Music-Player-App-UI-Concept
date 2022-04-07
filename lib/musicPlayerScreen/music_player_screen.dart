import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  double sliderValue = 0.0;

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: defaultPadding * 0.5),
              child: Row(
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
            const SizedBox(height: defaultPadding),
            Container(
              height: _size.width - defaultPadding,
              width: _size.width - defaultPadding,
              padding: const EdgeInsets.all(0.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "lib/assets/images/05.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: defaultPadding),
            const Text(
              "Blue",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                Expanded(
                  child: Text(
                    "Jonas Blue",
                    style: TextStyle(
                      fontSize: 20.0,
                      height: 0.9,
                    ),
                  ),
                ),
                Icon(
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
    );
  }
}
