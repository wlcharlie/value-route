import 'package:flame/camera.dart';
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

    // this will make the value route hide behind the sprite
    game.camera = CameraComponent.withFixedResolution(
      width: 393,
      height: 852,
    )..viewfinder.anchor = Anchor.topLeft;

    // game.camera.viewfinder.anchor = Anchor.topLeft;
    // game.camera.viewport = FixedResolutionViewport(
    //   resolution: Vector2(393, 852),
    // );

    add(room);
  }
}
