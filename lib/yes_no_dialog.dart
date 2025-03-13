import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class RoundedButton extends PositionComponent with TapCallbacks {
  RoundedButton({
    required this.text,
    required this.action,
    required Color color,
    required Color borderColor,
    super.position,
    super.anchor = Anchor.center,
  }) : _textDrawable = TextPaint(
          style: const TextStyle(
            fontSize: 20,
            color: Color(0xFF000000),
            fontWeight: FontWeight.w800,
          ),
        ).toTextPainter(text) {
    size = Vector2(150, 40);
    _textOffset = Offset(
      (size.x - _textDrawable.width) / 2,
      (size.y - _textDrawable.height) / 2,
    );
    _rrect = RRect.fromLTRBR(0, 0, size.x, size.y, Radius.circular(size.y / 2));
    _bgPaint = Paint()..color = color;
    _borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = borderColor;
  }

  final String text;
  final void Function() action;
  final TextPainter _textDrawable;
  late final Offset _textOffset;
  late final RRect _rrect;
  late final Paint _borderPaint;
  late final Paint _bgPaint;

  @override
  void render(Canvas canvas) {
    canvas.drawRRect(_rrect, _bgPaint);
    canvas.drawRRect(_rrect, _borderPaint);
    _textDrawable.paint(canvas, _textOffset);
  }

  @override
  void onTapDown(TapDownEvent event) {
    scale = Vector2.all(1.05);
  }

  @override
  void onTapUp(TapUpEvent event) {
    scale = Vector2.all(1.0);
    action();
  }

  @override
  void onTapCancel(TapCancelEvent event) {
    scale = Vector2.all(1.0);
  }
}

class YesNoDialog extends ValueRoute<bool> {
  YesNoDialog() : super(value: false);

  @override
  Component build() {
    final gameSize = findGame()!.size;
    const margin = 10.0;
    final boxSize = Vector2(350, 100);
    return PositionComponent(
      position: Vector2(gameSize.x / 2, gameSize.y / 2),
      size: boxSize,
      anchor: Anchor.topCenter,
      children: [
        RectangleComponent(
          size: boxSize,
          paint: Paint()..color = const Color(0xFFAA0000),
        ),
        TextComponent(
          position: Vector2.all(margin),
          text: 'Remove the planet?',
        ),
        RoundedButton(
          text: 'Yes',
          action: () => completeWith(true),
          color: Colors.green,
          borderColor: Colors.white,
          position: Vector2(boxSize.x / 4, boxSize.y - 30),
        ),
        RoundedButton(
          text: 'No',
          action: () => completeWith(false),
          color: Colors.red,
          borderColor: Colors.white,
          position: Vector2(boxSize.x * 0.75, boxSize.y - 30),
        ),
      ],
    );
  }
}
