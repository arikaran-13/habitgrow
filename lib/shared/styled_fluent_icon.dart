import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:flutter/material.dart';

class StyledFluentIcon extends StatelessWidget {
  const StyledFluentIcon({required this.fluentData, super.key});

  final FluentData fluentData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: FluentUiEmojiIcon(fl: fluentData, h: 52.0, w: 52.0),
    );
  }
}
