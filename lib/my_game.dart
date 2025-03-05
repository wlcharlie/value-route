import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:value_route/home_world.dart';

class MyGame extends FlameGame with PanDetector {
  late final RouterComponent router;

  @override
  bool debugMode = true;

  @override
  void onLoad() {
    add(router = RouterComponent(
      routes: {
        'home': Route(HomeWorld.new),
      },
      initialRoute: 'home',
    ));
    add(router);

    camera = CameraComponent.withFixedResolution(
      width: 393,
      height: 852,
    );
  }
}
