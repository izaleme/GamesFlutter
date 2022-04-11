import 'dart:ui';

import 'package:animation/components/gnat.dart';
import 'package:flame/components/animation_component.dart';

import '../main.dart';
import 'Explosion.dart';

class Minotaur extends AnimationComponent {
  static const TIME = 0.75;
  List<Gnat> gnatList = <Gnat>[];

  Minotaur(Offset position, List<Gnat> gnatList)
      : super.sequenced(130, 130, 'minotaur-2.png', 6,
            textureWidth: 96.0, textureHeight: 96.0) {
    this.x = position.dx - 65;
    this.y = position.dy - 65;
    this.animation.stepTime = TIME / 7;
    this.gnatList = gnatList;
  }

  @override
  void update(double t) {
    if (this.gnatList.isNotEmpty) {
      gnatList.forEach((gnat) {
        if (!gnat.remove) {
          bool remove = this.toRect().contains(gnat.toRect().topCenter);
          if (remove) {
            gnat.remove = true;
            points += 1;
            // game.add(new Explosion(gnat));
          }
        }
      });
    }
    super.update(t);
  }

  @override
  bool destroy() {
    return this.animation.isLastFrame;
  }
}
