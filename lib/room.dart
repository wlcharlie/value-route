import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:value_route/my_game.dart';
import 'package:value_route/paper_ball.dart';
import 'package:value_route/yes_no_dialog.dart';

class Room extends Component with HasGameReference<MyGame> {
  @override
  ComponentKey get key => ComponentKey.named("bed_room");

  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(PaperBall(
      position: Vector2(264, 450),
      onTapDownCallback: (event) async {
        print('PaperBall!!');
        final result = await game.router.pushAndWait(YesNoDialog());
        print('result: ${result.toString()}');
      },
    ));
  }
}
