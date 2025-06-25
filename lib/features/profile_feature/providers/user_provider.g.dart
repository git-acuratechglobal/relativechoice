// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserProfileHash() => r'f8be2f4c0fbc88705b0edefb2d51e1dc7894f332';

/// See also [getUserProfile].
@ProviderFor(getUserProfile)
final getUserProfileProvider = AutoDisposeFutureProvider<UserModel>.internal(
  getUserProfile,
  name: r'getUserProfileProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUserProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetUserProfileRef = AutoDisposeFutureProviderRef<UserModel>;
String _$getMatchedUserProfileHash() =>
    r'60e4a5cc2c3a446c1f7c83bdf7cb5723908e56cd';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getMatchedUserProfile].
@ProviderFor(getMatchedUserProfile)
const getMatchedUserProfileProvider = GetMatchedUserProfileFamily();

/// See also [getMatchedUserProfile].
class GetMatchedUserProfileFamily extends Family<AsyncValue<UserModel>> {
  /// See also [getMatchedUserProfile].
  const GetMatchedUserProfileFamily();

  /// See also [getMatchedUserProfile].
  GetMatchedUserProfileProvider call({
    required int userId,
  }) {
    return GetMatchedUserProfileProvider(
      userId: userId,
    );
  }

  @override
  GetMatchedUserProfileProvider getProviderOverride(
    covariant GetMatchedUserProfileProvider provider,
  ) {
    return call(
      userId: provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getMatchedUserProfileProvider';
}

/// See also [getMatchedUserProfile].
class GetMatchedUserProfileProvider
    extends AutoDisposeFutureProvider<UserModel> {
  /// See also [getMatchedUserProfile].
  GetMatchedUserProfileProvider({
    required int userId,
  }) : this._internal(
          (ref) => getMatchedUserProfile(
            ref as GetMatchedUserProfileRef,
            userId: userId,
          ),
          from: getMatchedUserProfileProvider,
          name: r'getMatchedUserProfileProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getMatchedUserProfileHash,
          dependencies: GetMatchedUserProfileFamily._dependencies,
          allTransitiveDependencies:
              GetMatchedUserProfileFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetMatchedUserProfileProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final int userId;

  @override
  Override overrideWith(
    FutureOr<UserModel> Function(GetMatchedUserProfileRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetMatchedUserProfileProvider._internal(
        (ref) => create(ref as GetMatchedUserProfileRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<UserModel> createElement() {
    return _GetMatchedUserProfileProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetMatchedUserProfileProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetMatchedUserProfileRef on AutoDisposeFutureProviderRef<UserModel> {
  /// The parameter `userId` of this provider.
  int get userId;
}

class _GetMatchedUserProfileProviderElement
    extends AutoDisposeFutureProviderElement<UserModel>
    with GetMatchedUserProfileRef {
  _GetMatchedUserProfileProviderElement(super.provider);

  @override
  int get userId => (origin as GetMatchedUserProfileProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
