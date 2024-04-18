import 'package:flutter/material.dart';

import '../../domain/entities/food.dart';
import 'app_string.dart';

class AppAnother {
  AppAnother._();
  static GlobalKey<FormState> setAndRestTimeKey = GlobalKey<FormState>();
  static const List<String> exerciseMethod = [
    AppString.inTheGym,
    AppString.calisthenics,
    AppString.cardio,
  ];
  static const List<Food> listFood = [
    Food(
      name: AppString.rice,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.beef,
      calories: 182.3,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.pork,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.chickenBreast,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.chicken,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.duckBreast,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.duck,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.chickenEgg,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.duckEgg,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.tuna,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.bread,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.sanwich,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.tilapia,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.milk,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.soymilk,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.potato,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.tomato,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.sweetPotato,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
    Food(
      name: AppString.orange,
      calories: 122.8,
      protein: 2.91,
      carb: 26.9,
      fat: 0.38,
    ),
  ];
  static List<String> listDayOfWeek = [
    AppString.monday,
    AppString.tuesday,
    AppString.wednesday,
    AppString.thursday,
    AppString.friday,
    AppString.saturday,
    AppString.sunday
  ];
  static const List<String> muscleGroupCalis = [
    AppString.chestAndTriceps,
    AppString.backAndBiceps,
    AppString.core,
    AppString.legAndGlutesCalis,
    AppString.shoulderCalis
  ];
  static const List<String> muscleGroup = [
    AppString.chest,
    AppString.back,
    AppString.shoulder,
    AppString.arm,
    AppString.core,
    AppString.legAndGlutes,
  ];
  static const Map<String, List<String>> exerciseCalis = {
    AppString.chestAndTriceps: chestAndTricepsExercise,
    AppString.backAndBiceps: backAndBicepsExercise,
    AppString.shoulderCalis: shoulderCalisExercise,
    AppString.core: coreCalisExericse,
    AppString.legAndGlutesCalis: legAndGlutesCalisExercsie
  };

  static const Map<String, List<String>> exercise = {
    AppString.chest: chestExercise,
    AppString.back: backExercise,
    AppString.legAndGlutes: legAndGlutesExercise,
    AppString.shoulder: shoulderExercise,
    AppString.core: coreCalisExericse,
    AppString.arm: armExercise
  };
  static const List<String> chestAndTricepsExercise = [
    AppString.regularDips,
    AppString.regularPushUps,
    AppString.diamondPushUps,
    AppString.benchDips,
    AppString.clapPushUps,
    AppString.widePushUps,
    AppString.inclinePushUps,
    AppString.spidermanPushUps,
    AppString.oneArmPushUps
  ];
  static const List<String> backAndBicepsExercise = [
    AppString.wideGripPullUps,
    AppString.narrowGripPullups,
    AppString.archerPullUps,
    AppString.backExtension,
    AppString.australianPullUps,
    AppString.behindTheNeckPullUps,
    AppString.aroundTheWorldPullUps,
    AppString.frontLeverTuckPullUps,
    AppString.pullUpHold
  ];
  static const List<String> shoulderCalisExercise = [
    AppString.handstandPushUps,
    AppString.pikePushUps,
    AppString.hinduPushUps,
    AppString.tbarPushUps,
    AppString.pseudoPushUps,
    AppString.helicopters,
    AppString.singleArmPlank,
    AppString.declinePushUps,
    AppString.koreanDips,
    AppString.alternatePushUpsHold
  ];
  static const List<String> chestExercise = [
    AppString.inclineBenchPress,
    AppString.benchPress,
    AppString.dips,
    AppString.declineBenchPress,
    AppString.dumbbellBenchPress,
    AppString.dumbbellInclinePress,
    AppString.cableCrossOver,
    AppString.flies,
    AppString.pecDeckMachine,
    AppString.chestPressMachine
  ];
  static const List<String> legAndGlutesCalisExercsie = [
    AppString.pistolSquats,
    AppString.oneLeggedBackExension,
    AppString.wallSit,
    AppString.wideSquats,
    AppString.singelLegDeadlift,
    AppString.calfRaise
  ];
  static const List<String> coreCalisExericse = [
    AppString.bearCrawl,
    AppString.dragonflies,
    AppString.hangingLegRaises,
    AppString.bicycleCrunches,
    AppString.reverseCrunch,
    AppString.sidePlank,
    AppString.vUps,
    AppString.flutterKicks,
    AppString.lSit
  ];

  static const List<String> backExercise = [
    AppString.chinUps,
    AppString.pullUp,
    AppString.chestSupportedRowing,
    AppString.bentOverBarbellRowing,
    AppString.tbarRow,
    AppString.oneArmDumbbellRow,
    AppString.latPullDownVariations,
    AppString.cableSeatedRowingVariations,
    AppString.cornerRows,
    AppString.invertedBarRow,
    AppString.facePull,
    AppString.straightArmsPulldown,
    AppString.cablePullover,
    AppString.machineSeatedRow,
    AppString.machineLatPulldowmn,
    AppString.machineRearDelt,
    AppString.rearDeltDumbbellFly,
  ];
  static const List<String> shoulderExercise = [
    AppString.barbellShoulderPress,
    AppString.dumbbellShoulderPress,
    AppString.fontRaise,
    AppString.lateralRaise,
    AppString.cableUprightRow,
    AppString.frontCableRaise,
    AppString.smithMachineOverheadShoulderPress,
    AppString.pushPress,
    AppString.shoulderPress,
    AppString.seatedBarbellShoulderPress,
    AppString.seatedDumbbellPress,
    AppString.standingDumbbellPress,
    AppString.arnoldPress,
    AppString.scottPress
  ];
  static const List<String> armExercise = [
    AppString.closeGripBenchPress,
    AppString.closeGripDeclinePress,
    AppString.tricepsDips,
    AppString.closeGripInclinePress,
    AppString.reverseGripBenchPress,
    AppString.jmPress,
    AppString.declineBarbellTricepsExtension,
    AppString.declineDumbbellTricepsExtension,
    AppString.flatBarbellTricepsExtention,
    AppString.overHeadDumbbellTricepsExtension,
    AppString.overheadBarTricepsExtension,
    AppString.cableTricepsExtension,
    AppString.tricepsExtensionMachines,
    //
    AppString.standingBarbellCurl,
    AppString.preacherCurl,
    AppString.hammerCurl,
    AppString.seatedDumbbellCurl,
    AppString.preacherDumbbellCurl,
    AppString.reverseBarbellCurl,
    AppString.zottmanCurl,
    AppString.machineCurl,
    AppString.cableCurl,
    AppString.cancentrationCurl
  ];

  static const List<String> legAndGlutesExercise = [
    AppString.lowbarSquat,
    AppString.heightbarSquat,
    AppString.frontSquat,
    AppString.lunges,
    AppString.splitSquad,
    AppString.barbellHackSquat,
    AppString.legPress,
    AppString.dumbbellSquat,
    AppString.machineHackSquat,
    AppString.sissySquat,
    AppString.stepUp,
    AppString.legExtension,
    //
    AppString.deadlift,
    AppString.romanianDeadlift,
    AppString.sumoDeadlift,
    AppString.stiffLegDeadlift,
    AppString.snatchGripDeadlift,
    AppString.goodMorning,
    AppString.gluteHamRaise,
    AppString.reverseHyper,
    AppString.pullThrough,
    AppString.legCurl,
    AppString.cableHipExtension
  ];

  static const List<String> cardioMethod = [
    AppString.lissCardio,
    AppString.hittCardio
  ];
  static const List<String> lissCardioExercise = [
    AppString.joggingIndoors,
    AppString.joggingOutdoors,
    AppString.walkingIndoors,
    AppString.walkingOutdoors,
    AppString.cyclingIndoors,
    AppString.cyclingOutdoors,
    AppString.rowingMachine,
    AppString.ropeJumping,
    AppString.swim
  ];
  static const List<String> cardioExerciseShare = [
    AppString.jumpingJack,
    AppString.highKnees,
    AppString.burpee,
    AppString.jumpSquat,
    AppString.mountainClimbing,
    AppString.jumpingLunge,
    AppString.sideSkater,
    AppString.kettlebellSwing,
    AppString.plankJack,
    AppString.sidePlank,
    AppString.pushUps,
    AppString.sideJackknife,
    AppString.russianTwist,
    AppString.trxPullup,
    AppString.inchWorms,
    AppString.halos,
    AppString.plankHold,
    AppString.squats,
    AppString.fastFeet,
    AppString.halfBurpees,
    AppString.squatThrust,
    AppString.jumpingSplitSquat,
    AppString.bulgarianSplitSquat,
    AppString.strandardPushup,
    AppString.toeTap,
    AppString.starJump,
    AppString.powerJack,
    AppString.londonBridge,
    AppString.handWalkOut,
    AppString.buttKick,
    AppString.seatedInOut,
    AppString.chairSitups,
    AppString.layingLegRaise,
    AppString.reachups,
    AppString.starCrunch,
    AppString.bicycles,
    AppString.boltHold,
    AppString.seatedLegFlutter,
    AppString.crucifix,
    AppString.alternatingSingleLegRaise,
    AppString.staticHold,
    AppString.toeTouches,
    AppString.inOutClose,
    AppString.switchingMountedClimbers,
    AppString.plankAlternatingToeTops,
    AppString.plankKneeToElbows,
    AppString.plankPushUp,
    AppString.sidePlankRaises,
    AppString.highPlankToeTaps
  ];
}
