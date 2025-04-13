import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../webapi/abstractAPI/baseMatchService.dart';



class ScoreBoardWidgetController extends GetxController {
  late BaseMatchService matchService;
  RxInt TeamASelectedPlayer = 1.obs;
  RxInt teamAScore = 0.obs;
  RxInt teamBScore = 0.obs;
  Rx<TextDirection> TeamAFlowDirection = TextDirection.ltr.obs;
  Rx<TextDirection> TeamBFlowDirection = TextDirection.ltr.obs;

  @override
  void onInit() async {
    TeamASelectedPlayer = 1.obs;
    // var data = await matchService.getMatch(1);
  }

  Future<void> IncreaseTeamAScore() async {
    // matchService = ApiServiceFactory.createMatchApiService();
    // var data = await matchService.getMatch(1);
    teamAScore.value = teamAScore.value + 1;
    update();
  }

  Future<void> IncreaseTeamBScore() async {
    teamBScore.value = teamBScore.value + 1;
    update();
  }

  Future<void> ChangeTeamADirection() async {
    if (TeamAFlowDirection.value == TextDirection.ltr) {
      TeamAFlowDirection.value = TextDirection.rtl;
    } else {
      TeamAFlowDirection.value = TextDirection.ltr;
    }
    update();
  }

  Future<void> ChangeTeamBDirection() async {
    if (TeamBFlowDirection.value == TextDirection.ltr) {
      TeamBFlowDirection.value = TextDirection.rtl;
    } else {
      TeamBFlowDirection.value = TextDirection.ltr;
    }
    update();
  }
  Future <void> ReStartMatch() async{
    TeamAFlowDirection = TextDirection.ltr.obs;
    TeamBFlowDirection = TextDirection.ltr.obs;
    teamAScore = 0.obs;
    RxInt teamBScore = 0.obs;
  }
}
