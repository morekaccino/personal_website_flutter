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
  double division_factor = 1.5;
  @override
  Widget build(BuildContext context) {
    if (widget.screenWidth > 1000)
      division_factor = 2.3;
    return AnimatedPositioned(
      duration: widget._duration,
      curve: Curves.linear,
      left:
      (Random().nextDouble() * (8/5) * widget.screenWidth) - widget.screenWidth,
      top: (Random().nextDouble() * (widget.screenHeight + (2/5) * widget.screenWidth)) - ((2/5) * widget.screenWidth),
      child: AnimatedContainer(
        duration: widget._duration,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000 * Random().nextDouble()),
          color: widget._color.withOpacity(1),
        ),
        height: (Random().nextDouble() + .5) * widget.screenWidth / division_factor,
        width: (Random().nextDouble() + .5) * widget.screenWidth / division_factor,
      ),
    );
  }
}