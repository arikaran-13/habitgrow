import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

class Goal {
  String id;
  String name;
  Color color;
  GoalStatus status;

  Goal({
    required this.id,
    required this.name,
    required this.color,
    required this.status,
  });

  Map<String, dynamic> toFirestore() {
    return {'name': name, 'color': color.toARGB32(), 'status': status.name};
  }

  factory Goal.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    var data = snapshot.data()!;

    return Goal(
      id: snapshot.id,
      name: data['name'],
      color: Color(data['color']),
      status: GoalStatus.values.byName(data['status']),
    );
  }
}

enum GoalStatus { active, completed, skipped }
