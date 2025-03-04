import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:value_route/my_game.dart';

void main() {
  runApp(
    GameWidget<MyGame>(
      game: MyGame(),
    ),
  );
}
