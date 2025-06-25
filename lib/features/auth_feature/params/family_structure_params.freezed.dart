// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'family_structure_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FamilyStructure _$FamilyStructureFromJson(Map<String, dynamic> json) {
  return _FamilyStructure.fromJson(json);
}

/// @nodoc
mixin _$FamilyStructure {
  @JsonKey(name: 'family_structure')
  String? get familyStructure => throw _privateConstructorUsedError;
  @JsonKey(name: 'family_consideration')
  int? get familyConsideration => throw _privateConstructorUsedError;
  String? get household => throw _privateConstructorUsedError;
  @JsonKey(name: 'household_additional_detail')
  String? get householdAdditionalDetail => throw _privateConstructorUsedError;

  /// Serializes this FamilyStructure to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FamilyStructure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FamilyStructureCopyWith<FamilyStructure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FamilyStructureCopyWith<$Res> {
  factory $FamilyStructureCopyWith(
          FamilyStructure value, $Res Function(FamilyStructure) then) =
      _$FamilyStructureCopyWithImpl<$Res, FamilyStructure>;
  @useResult
  $Res call(
      {@JsonKey(name: 'family_structure') String? familyStructure,
      @JsonKey(name: 'family_consideration') int? familyConsideration,
      String? household,
      @JsonKey(name: 'household_additional_detail')
      String? householdAdditionalDetail});
}

/// @nodoc
class _$FamilyStructureCopyWithImpl<$Res, $Val extends FamilyStructure>
    implements $FamilyStructureCopyWith<$Res> {
  _$FamilyStructureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FamilyStructure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? familyStructure = freezed,
    Object? familyConsideration = freezed,
    Object? household = freezed,
    Object? householdAdditionalDetail = freezed,
  }) {
    return _then(_value.copyWith(
      familyStructure: freezed == familyStructure
          ? _value.familyStructure
          : familyStructure // ignore: cast_nullable_to_non_nullable
              as String?,
      familyConsideration: freezed == familyConsideration
          ? _value.familyConsideration
          : familyConsideration // ignore: cast_nullable_to_non_nullable
              as int?,
      household: freezed == household
          ? _value.household
          : household // ignore: cast_nullable_to_non_nullable
              as String?,
      householdAdditionalDetail: freezed == householdAdditionalDetail
          ? _value.householdAdditionalDetail
          : householdAdditionalDetail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FamilyStructureImplCopyWith<$Res>
    implements $FamilyStructureCopyWith<$Res> {
  factory _$$FamilyStructureImplCopyWith(_$FamilyStructureImpl value,
          $Res Function(_$FamilyStructureImpl) then) =
      __$$FamilyStructureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'family_structure') String? familyStructure,
      @JsonKey(name: 'family_consideration') int? familyConsideration,
      String? household,
      @JsonKey(name: 'household_additional_detail')
      String? householdAdditionalDetail});
}

/// @nodoc
class __$$FamilyStructureImplCopyWithImpl<$Res>
    extends _$FamilyStructureCopyWithImpl<$Res, _$FamilyStructureImpl>
    implements _$$FamilyStructureImplCopyWith<$Res> {
  __$$FamilyStructureImplCopyWithImpl(
      _$FamilyStructureImpl _value, $Res Function(_$FamilyStructureImpl) _then)
      : super(_value, _then);

  /// Create a copy of FamilyStructure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? familyStructure = freezed,
    Object? familyConsideration = freezed,
    Object? household = freezed,
    Object? householdAdditionalDetail = freezed,
  }) {
    return _then(_$FamilyStructureImpl(
      familyStructure: freezed == familyStructure
          ? _value.familyStructure
          : familyStructure // ignore: cast_nullable_to_non_nullable
              as String?,
      familyConsideration: freezed == familyConsideration
          ? _value.familyConsideration
          : familyConsideration // ignore: cast_nullable_to_non_nullable
              as int?,
      household: freezed == household
          ? _value.household
          : household // ignore: cast_nullable_to_non_nullable
              as String?,
      householdAdditionalDetail: freezed == householdAdditionalDetail
          ? _value.householdAdditionalDetail
          : householdAdditionalDetail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FamilyStructureImpl implements _FamilyStructure {
  const _$FamilyStructureImpl(
      {@JsonKey(name: 'family_structure') this.familyStructure,
      @JsonKey(name: 'family_consideration') this.familyConsideration = 1,
      this.household,
      @JsonKey(name: 'household_additional_detail')
      this.householdAdditionalDetail});

  factory _$FamilyStructureImpl.fromJson(Map<String, dynamic> json) =>
      _$$FamilyStructureImplFromJson(json);

  @override
  @JsonKey(name: 'family_structure')
  final String? familyStructure;
  @override
  @JsonKey(name: 'family_consideration')
  final int? familyConsideration;
  @override
  final String? household;
  @override
  @JsonKey(name: 'household_additional_detail')
  final String? householdAdditionalDetail;

  @override
  String toString() {
    return 'FamilyStructure(familyStructure: $familyStructure, familyConsideration: $familyConsideration, household: $household, householdAdditionalDetail: $householdAdditionalDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FamilyStructureImpl &&
            (identical(other.familyStructure, familyStructure) ||
                other.familyStructure == familyStructure) &&
            (identical(other.familyConsideration, familyConsideration) ||
                other.familyConsideration == familyConsideration) &&
            (identical(other.household, household) ||
                other.household == household) &&
            (identical(other.householdAdditionalDetail,
                    householdAdditionalDetail) ||
                other.householdAdditionalDetail == householdAdditionalDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, familyStructure,
      familyConsideration, household, householdAdditionalDetail);

  /// Create a copy of FamilyStructure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FamilyStructureImplCopyWith<_$FamilyStructureImpl> get copyWith =>
      __$$FamilyStructureImplCopyWithImpl<_$FamilyStructureImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FamilyStructureImplToJson(
      this,
    );
  }
}

abstract class _FamilyStructure implements FamilyStructure {
  const factory _FamilyStructure(
      {@JsonKey(name: 'family_structure') final String? familyStructure,
      @JsonKey(name: 'family_consideration') final int? familyConsideration,
      final String? household,
      @JsonKey(name: 'household_additional_detail')
      final String? householdAdditionalDetail}) = _$FamilyStructureImpl;

  factory _FamilyStructure.fromJson(Map<String, dynamic> json) =
      _$FamilyStructureImpl.fromJson;

  @override
  @JsonKey(name: 'family_structure')
  String? get familyStructure;
  @override
  @JsonKey(name: 'family_consideration')
  int? get familyConsideration;
  @override
  String? get household;
  @override
  @JsonKey(name: 'household_additional_detail')
  String? get householdAdditionalDetail;

  /// Create a copy of FamilyStructure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FamilyStructureImplCopyWith<_$FamilyStructureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
