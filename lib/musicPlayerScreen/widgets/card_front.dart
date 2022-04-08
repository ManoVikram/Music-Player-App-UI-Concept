import 'package:flutter/material.dart';

class CardFront extends StatelessWidget {
  const CardFront({
    Key? key,
    required Size size,
    required this.coverImage,
  })  : _size = size,
        super(key: key);

  final Size _size;
  final String coverImage;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: coverImage,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.asset(
          coverImage,
          fit: BoxFit.cover,
          height: _size.width - 20.0,
        ),
      ),
    );
  }
}
