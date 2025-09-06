import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habitgrow/models/goal.dart';
import 'package:logger/web.dart';

class FirestoreService {
  var log = Logger();
  static final ref = FirebaseFirestore.instance
      .collection('goals')
      .withConverter(
        fromFirestore: (documentSnapshot, _) =>
            Goal.fromFirestore(documentSnapshot),
        toFirestore: (goal, _) => goal.toFirestore(),
      );

  Future<void> createGoal(Goal goal) async {
    await ref.doc(goal.id).set(goal);
    log.i("Goal created {}${goal.id}");
  }

  Stream<List<Goal>> getGoals() {
    return ref.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }
}
