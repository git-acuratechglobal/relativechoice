import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_choice/core/services/home_service/home_service.dart';
import 'package:relative_choice/features/home_feature/models/activity_tab_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'activity_provider.g.dart';

@riverpod
Future<ActivityTabState> activityTabData(Ref ref) async {
  final matchedPeoplesData =
      await ref.watch(homeServiceProvider).getMatchedPeoplesList();
  final suggestedMatchesData =
      await ref.watch(homeServiceProvider).getSuggestedMatchesPeoplesList();
  final usersShowCase =
      await ref.watch(homeServiceProvider).getUsersShowcaseList();

  final dailyTips = await ref.watch(homeServiceProvider).getDailyTips();

  return ActivityTabState(
      matchedPeoplesList: matchedPeoplesData,
      suggestedMatchesList: suggestedMatchesData,
      usersShowcaseImages: usersShowCase,
      dailyTips: dailyTips);
}
