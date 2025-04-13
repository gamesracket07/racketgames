import 'dart:convert';
import 'package:flutter/services.dart' as rootBundle;
import '../../app/data/models/match_model.dart';

import '../abstractAPI/baseMatchService.dart';

class MockMatchService extends BaseMatchService{
  @override
  Future<MatchModel> getMatch(int matchID) async {
    // Load the JSON file
    final jsonString = await rootBundle.rootBundle.loadString('json/match_data.json');
print(jsonString);
    Map<String, dynamic> matchJson = json.decode(jsonString);
    MatchModel match = MatchModel.fromJson(matchJson['match']);
    // Decode the JSON string
   // final List<dynamic> jsonList = json.decode(jsonString);
  //var data=  MatchResponseDto.fromRawJson(jsonString);
    // Convert the JSON list into a list of User objects
    return match;
  }
  
}