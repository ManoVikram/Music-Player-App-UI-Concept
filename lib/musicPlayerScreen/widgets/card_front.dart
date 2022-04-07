import 'package:flutter/material.dart';

class CardFront extends StatelessWidget {
  const CardFront({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.asset(
        "lib/assets/images/05.jpg",
        fit: BoxFit.cover,
        height: _size.width - 20.0,
      ),
    );
  }
}
