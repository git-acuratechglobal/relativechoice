

import '../../profile_feature/model/user_model.dart';

class ActivityTabState {
  List<User> matchedPeoplesList;
  List<User> suggestedMatchesList;
  List<User> usersShowcaseImages;
  ActivityTabState(
      {required this.matchedPeoplesList,
      required this.suggestedMatchesList,
      required this.usersShowcaseImages});
}
