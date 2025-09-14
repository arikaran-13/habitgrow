import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:flutter/material.dart';
import 'package:habitgrow/shared/empty_state.dart';

class Weekly extends StatefulWidget {
  const Weekly({super.key});

  @override
  State<Weekly> createState() => _WeeklyState();
}

class _WeeklyState extends State<Weekly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EmptyState(
        icon: FluentUiEmojiIcon(fl: Fluents.flCalendar, h: 100),
        message: "A week of focus builds a lifetime of success 📅",
      ),
    );
  }
}
