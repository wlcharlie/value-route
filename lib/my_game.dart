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
    router = RouterComponent(
      routes: {
        'home': WorldRoute(HomeWorld.new),
      },
      initialRoute: 'home',
    );
    add(router);
  }
}
