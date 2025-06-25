import '../../profile_feature/model/user_model.dart';


class LikeTabState{

  List<User> likedByMeTabList;
  List<User> likedMeTabList;
  List<User> mayBeTabList;
  LikeTabState({required this.likedByMeTabList,required this.likedMeTabList,required this.mayBeTabList});
}