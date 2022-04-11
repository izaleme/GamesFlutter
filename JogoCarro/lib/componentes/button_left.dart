import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const ComponentSize = 60.0;
const SPEED = 150.0;

class ButtonLeft extends SpriteComponent {
  Size dimensions;
  double direction = 0.0;

  ButtonLeft(this.dimensions)
      : super.square(ComponentSize, 'play-button_left.png');

  @override
  void update(double t) {
    super.update(t);
    x += 200 * t * direction;
  }

  @override
  bool destroy() {
    return false;
  }

  @override
  void resize(Size size) {
    this.x = 10;
    this.y = size.height - ComponentSize;
  }
}
