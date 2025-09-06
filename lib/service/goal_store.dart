import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitgrow/models/goal.dart';
import 'package:habitgrow/service/firestore_service.dart';

final firestoreServiceProvider = Provider<FirestoreService>(
  (ref) => FirestoreService(),
);

final todayGoalsProvider = StreamProvider<List<Goal>>((ref) {
  var service = ref.watch(firestoreServiceProvider);
  return service.getGoals();
});
