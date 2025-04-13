import '../../app/data/models/match_model.dart';


abstract class BaseMatchService {
  Future<MatchModel> getMatch(int matchID);
}
