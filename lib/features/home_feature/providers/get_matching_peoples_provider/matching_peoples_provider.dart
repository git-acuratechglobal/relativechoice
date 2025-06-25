import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/services/home_service/home_service.dart';
import '../../../profile_feature/model/user_model.dart';
part 'matching_peoples_provider.g.dart';
@riverpod
Future<List<User>> getSuggestedMatchesPeoplesList(Ref ref) async {
  return await ref.watch(homeServiceProvider).getSuggestedMatchesPeoplesList();
}
