import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:value_route/my_game.dart';
import 'package:value_route/paper_ball.dart';

class Room extends Component with HasGameReference<MyGame> {
  @override
  ComponentKey get key => ComponentKey.named("bed_room");

  @override
  Future<void> onLoad() async {
    super.onLoad();

    add(PaperBall(
      position: Vector2(264, 677),
      onTapDownCallback: (event) async {
        print('PaperBall!!');
        final result = await game.router.pushAndWait(YesNoDialog('Dialog'));
        print('result: ${result.toString()}');
      },
    ));
  }
}

class YesNoDialog extends ValueRoute<bool> {
  YesNoDialog(this.text) : super(value: false);
  final String text;

  @override
  Component build() {
    return PositionComponent(
      size: Vector2(300, 100),
      position: Vector2(264, 677),
      children: [
        RectangleComponent(
          size: Vector2(300, 100),
          position: Vector2(0, 0),
          paint: Paint()..color = Color(0xFFFF0000),
        ),
        TextComponent(text: text),
        // Button(
        //   text: 'Yes',
        //   action: () => completeWith(true),
        // ),
        // Button(
        //   text: 'No',
        //   action: () => completeWith(false),
        // ),
      ],
    );
  }
}
