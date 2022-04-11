import 'package:animation/components/gnat.dart';
import 'package:animation/components/minotaur.dart';
import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/flame.dart';
import 'package:flutter/widgets.dart';
import 'package:flame/gestures.dart';

import 'components/background.dart';

var game;
var points = 0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.images.loadAll([
    'minotaur.png',
    'hunter.png',
    'ghost.png',
    'explosion.png',
    'minotaur-2.png'
  ]);
  Flame.audio.load('explosion.mp3');
  var dimensions = await Flame.util.initialDimensions();
  game = Game(dimensions);
  runApp(game.widget);
}

class Game extends BaseGame with TapDetector {
  Minotaur minotaur;
  List<Gnat> gnatList;
  Gnat gnat;
  Background _background;
  Size dimensions;
  bool backgroud = false;

  Game(this.dimensions) {
    gnatList = <Gnat>[];
    _background = new Background(dimensions);
  }

  double creationTimer = 0.0;
  @override
  void update(double t) {
    if (!backgroud) {
      add(_background);
      backgroud = true;
    }

    creationTimer += t;
    if (creationTimer >= 1.0) {
      creationTimer = 0.0;
      gnat = new Gnat();
      add(gnat);
      gnatList.add(gnat);
    }

    print('Placar: $points');
    super.update(t);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void onTapDown(TapDownDetails details) {
    tapInput(details.globalPosition);
  }

  void tapInput(Offset position) {
    minotaur = new Minotaur(position, gnatList);
    add(minotaur);
  }
}
