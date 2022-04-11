import 'dart:math';

import 'package:flame/components/component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:game_base/componentes/carro.dart';

const ComponentSize = 60.0;
const SPEED = 150.0;

class CarroInimigo extends SpriteComponent {
  bool remove = false;
  Size dimensions;
  Random random = new Random();

  Carro carro;
  bool destroyedBur = false;

  CarroInimigo(this.dimensions, this.carro)
      : super.square(ComponentSize, 'carro2.png');

  @override
  void update(double t) {
    super.update(t);
    this.y += t * SPEED;

    if (carro != null) {
      bool remove = this.toRect().contains(carro.toRect().bottomCenter) ||
          this.toRect().contains(carro.toRect().bottomLeft) ||
          this.toRect().contains(carro.toRect().bottomRight) ||
          this.toRect().contains(carro.toRect().topCenter);
      if (remove) {
        destroyedBur = true;
        carro.score--;
      }
    }
  }

  @override
  bool destroy() {
    return destroyedBur;
  }

  @override
  void resize(Size size) {
    var positionX = random.nextDouble();

    this.x = positionX * 300;
    this.y = 0;
  }
}
