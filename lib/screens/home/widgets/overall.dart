import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:flutter/material.dart';
import 'package:habitgrow/shared/empty_state.dart';

class Overall extends StatefulWidget {
  const Overall({super.key});

  @override
  State<Overall> createState() => _OverallState();
}

class _OverallState extends State<Overall> {
  @override
  Widget build(BuildContext context) {
    return EmptyState(
      icon: FluentUiEmojiIcon(fl: Fluents.flEvergreenTree, h: 100),
      message: "Plant the seed today, enjoy the forest tomorrow.",
    );
  }
}
