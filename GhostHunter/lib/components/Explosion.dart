import 'package:flame/components/animation_component.dart';
import 'package:flame/flame.dart';

import 'gnat.dart';

class Explosion extends AnimationComponent {
  static const TIME = 0.75;

  Explosion(Gnat gnat)
      : super.sequenced(40, 40, 'explosion.png', 3,
            textureWidth: 31.0, textureHeight: 31.0) {
    this.x = gnat.x;
    this.y = gnat.y;
    this.animation.stepTime = TIME / 7;
    // Flame.audio.play('explosion.mp3');
  }

  @override
  bool destroy() {
    return this.animation.isLastFrame;
  }
}
