import 'dart:math';

import 'package:flutter/material.dart';


class Bubble extends StatefulWidget {
  const Bubble({
    Key? key,
    required Duration duration,
    required this.screenWidth,
    required this.screenHeight,
    required Color color,
  })  : _duration = duration,
        _color = color,
        super(key: key);

  final Duration _duration;
  final double screenWidth;
  final double screenHeight;
  final Color _color;

  @override
  _BubbleState createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget._duration,
      left: (Random().nextDouble() * 3 * widget.screenWidth) - widget.screenWidth,
      top: (Random().nextDouble() * 3 * widget.screenHeight) - widget.screenWidth,
      child: AnimatedContainer(
        duration: widget._duration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000 * Random().nextDouble()),
          color: widget._color.withOpacity(1),
        ),
        height: (Random().nextDouble() + .3) * widget.screenWidth / 2,
        width: (Random().nextDouble() + .3) * widget.screenWidth / 2,
      ),
    );
  }
}