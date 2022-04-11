import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const ComponentSize = 60.0;

class Background extends SpriteComponent {
  Size dimensions;
  double direction = 0.0;

  Background(this.dimensions) : super.square(ComponentSize, 'background.png');

  @override
  void update(double t) {
    super.update(t);
  }

  @override
  bool destroy() {
    return false;
  }

  @override
  void resize(Size size) {
    this.x = 0;
    this.y = 0;
    this.width = size.width;
    this.height = size.height;
  }
}
