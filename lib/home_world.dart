import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:value_route/my_game.dart';
import 'package:value_route/room.dart';

class HomeWorld extends World with HasGameReference<MyGame> {
  final room = Room();

  static ComponentKey componentKey = ComponentKey.named("home_world");

  @override
  ComponentKey get key => componentKey;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await Flame.images.loadAll([
      "paper_ball.png",
    ]);

    game.camera.viewfinder.anchor = Anchor.topLeft;
    add(room);
  }
}
