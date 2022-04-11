import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';
import 'dart:ui';

const ComponentSize = 50.0;
const time = 20;

class Gnat extends SpriteComponent {
  Size dimensions;
  double direction = 0.0;
  double sizeGnat;
  final spriteSpeed = 18.0;
  final minSize = ComponentSize;
  final maxSize = 100.0;
  double xMax, yMax;
  double xSpeed, ySpeed;
  bool remove = false;
  bool wall = false;
  int creationTimer = 0;

  Gnat() : super.square(ComponentSize, 'ghost.png');

  @override
  bool destroy() {
    if (creationTimer > time && !remove) {
      remove = true;
    }
    return remove;
  }

  @override
  void resize(Size size) {
    Random random = Random();
    sizeGnat = minSize + random.nextDouble() * (maxSize - minSize);
    width = sizeGnat;
    height = sizeGnat;

    xMax = size.width;
    x = random.nextDouble() * (xMax - width);
    xSpeed = 30.0 + random.nextDouble() * 30.0;
    if (random.nextBool()) xSpeed = -xSpeed;

    yMax = size.height;
    y = random.nextDouble() * (yMax - height);
    ySpeed = 15.0 + random.nextDouble() * 60.0;
    if (random.nextBool()) ySpeed = -ySpeed;
  }

  @override
  void update(double dt) {
    super.update(dt);

    creationTimer = creationTimer + 1;

    x += xSpeed * dt;
    if (((x >= xMax - width) && xSpeed > 0) || (x < 0.0)) {
      xSpeed = -xSpeed;
      wall = true;
    }
    y += ySpeed * dt;
    if (((y > yMax - height) && (ySpeed > 0)) || ((y < 35.0 && (ySpeed < 0)))) {
      ySpeed = -ySpeed;
      wall = true;
    }
    sizeGnat += spriteSpeed * dt;
    if ((sizeGnat > maxSize) && wall) sizeGnat = minSize;
    width = sizeGnat;
    height = sizeGnat;
    wall = false;

    renderFlipX = xSpeed > 0 ? false : true;
    angle = atan(ySpeed / xSpeed);
  }
}
