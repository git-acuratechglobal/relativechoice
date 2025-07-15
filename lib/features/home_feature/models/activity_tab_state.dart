

import '../../profile_feature/model/user_model.dart';
import 'daily_tip_model.dart';

class ActivityTabState {
  List<User> matchedPeoplesList;
  List<User> suggestedMatchesList;
  List<User> usersShowcaseImages;
  List<DailyTipModel> dailyTips;
  ActivityTabState(
      {required this.matchedPeoplesList,
      required this.suggestedMatchesList,
      required this.usersShowcaseImages,
      required this.dailyTips
      });
}
