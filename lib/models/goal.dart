import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';

class Goal {
  String id;
  String name;
  Color color;
  GoalStatus status;
  FluentData? icon;

  Goal({
    required this.id,
    required this.name,
    required this.color,
    required this.status,
    this.icon,
  });

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'color': color.toARGB32(),
      'status': status.name,
      'fluentIconId': icon?.id ?? "",
      'fluentIconRaw': icon?.raw ?? "",
    };
  }

  factory Goal.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data()!;

    return Goal(
      id: snapshot.id,
      name: data['name'],
      color: Color(data['color']),
      status: GoalStatus.values.byName(data['status']),
      icon: FluentData(data['fluentIconId'], data['fluentIconRaw']),
    );
  }
}

enum GoalStatus { active, completed, skipped }
