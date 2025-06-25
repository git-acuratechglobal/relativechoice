import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'family_structure_params.freezed.dart';
part 'family_structure_params.g.dart';

@freezed
class FamilyStructure with _$FamilyStructure {
  const factory FamilyStructure({
    @JsonKey(name: 'family_structure')
    String? familyStructure,
    @JsonKey(name: 'family_consideration')
    @Default(1) int? familyConsideration,
    String? household,
    @JsonKey(name: 'household_additional_detail')
    String? householdAdditionalDetail,
  }) = _FamilyStructure;

  factory FamilyStructure.fromJson(Map<String, dynamic> json) =>
      _$FamilyStructureFromJson(json);
}

@Riverpod(keepAlive: true)
class FamilyStructureParams extends _$FamilyStructureParams {
  @override
  FamilyStructure build() {
    return FamilyStructure();
  }

  void update(FamilyStructure Function(FamilyStructure? p) updateParam) {
    state = updateParam(state);
  }
}
