import 'package:fluentui_emoji_icon/fluentui_emoji_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:habitgrow/models/goal.dart';
import 'package:habitgrow/service/firestore_service.dart';

final firestoreServiceProvider = Provider<FirestoreService>(
  (ref) => FirestoreService(),
);

final goalsProvider = StreamProvider<List<Goal>>((ref) {
  var service = ref.watch(firestoreServiceProvider);
  return service.getGoals();
});

final activeGoalsProvider = StreamProvider<List<Goal>>((ref) {
  var service = ref.watch(firestoreServiceProvider);
  return service.getGoals().map(
    (goals) => goals.where((goal) => goal.status == GoalStatus.active).toList(),
  );
});

final skippedGoalsProvider = StreamProvider<List<Goal>>((ref) {
  var service = ref.watch(firestoreServiceProvider);
  return service.getGoals().map(
    (goals) =>
        goals.where((goal) => goal.status == GoalStatus.skipped).toList(),
  );
});

final completedGoalsProvider = StreamProvider<List<Goal>>((ref) {
  var service = ref.watch(firestoreServiceProvider);
  return service.getGoals().map(
    (goals) =>
        goals.where((goal) => goal.status == GoalStatus.completed).toList(),
  );
});

// state of goal selected icon during goal creating stored here temporarily
final selectedGoalIcon = StateProvider<FluentData?>((ref) => null);

final sampleFluentIconsProvider = StateProvider<List<FluentData>>((ref) {
  return [
    Fluents.flAmericanFootball,
    Fluents.flSportsMedal,
    Fluents.flBullseye,
    Fluents.flTrophy,
    Fluents.flBasketball,
    Fluents.flIceSkate,
    Fluents.flBooks,
    Fluents.flSmilingFaceWithSunglasses,
    Fluents.flPingPong,
    Fluents.flBadminton,
    Fluents.flCricketGame,
    Fluents.flServiceDog,
  ];
});

var goalIconsProvider = StateProvider<List<FluentData>>((ref) {
  return [
    // Already added
    Fluents.flAmericanFootball,
    Fluents.flSportsMedal,
    Fluents.flBullseye,
    Fluents.flTrophy,
    Fluents.flBasketball,
    Fluents.flIceSkate,
    Fluents.flBooks,
    Fluents.flPingPong,
    Fluents.flBadminton,
    Fluents.flCricketGame,
    Fluents.flServiceDog,
    Fluents.flSled,
    Fluents.flFramedPicture,
    Fluents.flMahjongRedDragon,
    Fluents.flIceHockey,
    Fluents.flFieldHockey,
    Fluents.flVolleyball,
    Fluents.flRugbyFootball,
    Fluents.flTennis,
    Fluents.flTShirt,
    Fluents.flSlotMachine,
    Fluents.flPerformingArts,
    Fluents.flAdmissionTickets,
    Fluents.flFishingPole,
    Fluents.flJoker,
    Fluents.flCatFace,
    Fluents.flThread,
    Fluents.flNazarAmulet,
    Fluents.flTeddyBear,
    Fluents.flYarn,
    Fluents.flPuzzlePiece,
    Fluents.flDiamondSuit,
    Fluents.flSparkles,
    Fluents.flKnot,
    Fluents.flSoccerBall,
    Fluents.flBaseball,
    Fluents.flManGolfing,
    Fluents.flChessPawn,
    Fluents.flSpadeSuit,
    Fluents.flMagicWand,
    Fluents.flKite,
    Fluents.flStopwatch,
    Fluents.flLacrosse,
    Fluents.flJackOLantern,
    Fluents.flChristmasTree,
    Fluents.flFireworks,
    Fluents.flSparkler,
    Fluents.flPartyPopper,
    Fluents.flRibbon,
    Fluents.flRock,
    Fluents.flBoxingGlove,
    Fluents.flDivingMask,
    Fluents.flCrystalBall,
    Fluents.flPrincess,
    Fluents.flSoftball,
    Fluents.flKimono,
    Fluents.flCarpStreamer,
  ];
});

var goalsEmojiProvider = StateProvider<List<FluentData>>((ref) {
  return [
    Fluents.flSmilingFaceWithSunglasses,
    Fluents.flSmilingFaceWithSmilingEyes,
    Fluents.flSmilingFaceWithHeartEyes,
    Fluents.flKissingFace,
    Fluents.flRelievedFace,
    Fluents.flFaceWithTearsOfJoy,
    Fluents.flGrinningFace,
    Fluents.flFaceSavoringFood,
    Fluents.flLoudlyCryingFace,
    Fluents.flFaceWithTongue,
    Fluents.flWinkingFace,
    Fluents.flSleepingFace,
    Fluents.flAstonishedFace,
    Fluents.flShushingFace,
    Fluents.flSmirkingFace,
    Fluents.flAngryFace,
    Fluents.flPoutingFace,
    Fluents.flFaceWithMedicalMask,
    Fluents.flWoozyFace,
    Fluents.flFaceWithRaisedEyebrow,
    Fluents.flFaceWithSteamFromNose,
    Fluents.flExpressionlessFace,
    Fluents.flConfusedFace,
    Fluents.flFrowningFace,
    Fluents.flSmilingFaceWithHalo,
    Fluents.flZzz,
    Fluents.flHotFace,
    Fluents.flColdFace,
    Fluents.flExplodingHead,
    Fluents.flFaceWithSymbolsOnMouth,
    Fluents.flRollingOnTheFloorLaughing,
    Fluents.flFaceWithSpiralEyes,
    Fluents.flFaceWithOpenMouth,
    Fluents.flPleadingFace,
    Fluents.flKissingFaceWithClosedEyes,
    Fluents.flThinkingFace,
    Fluents.flFaceInClouds,
    Fluents.flFirecracker,
    Fluents.flRedEnvelope,
  ];
});
