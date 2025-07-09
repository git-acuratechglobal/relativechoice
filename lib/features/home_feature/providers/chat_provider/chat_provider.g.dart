// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getUserModelDataHash() => r'3d937cd9e73d2978ba3bf9dd1da4077d059263cb';

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

/// See also [getUserModelData].
@ProviderFor(getUserModelData)
const getUserModelDataProvider = GetUserModelDataFamily();

/// See also [getUserModelData].
class GetUserModelDataFamily extends Family<AsyncValue<UserDataModel>> {
  /// See also [getUserModelData].
  const GetUserModelDataFamily();

  /// See also [getUserModelData].
  GetUserModelDataProvider call({
    required String userId,
  }) {
    return GetUserModelDataProvider(
      userId: userId,
    );
  }

  @override
  GetUserModelDataProvider getProviderOverride(
    covariant GetUserModelDataProvider provider,
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
  String? get name => r'getUserModelDataProvider';
}

/// See also [getUserModelData].
class GetUserModelDataProvider
    extends AutoDisposeFutureProvider<UserDataModel> {
  /// See also [getUserModelData].
  GetUserModelDataProvider({
    required String userId,
  }) : this._internal(
          (ref) => getUserModelData(
            ref as GetUserModelDataRef,
            userId: userId,
          ),
          from: getUserModelDataProvider,
          name: r'getUserModelDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getUserModelDataHash,
          dependencies: GetUserModelDataFamily._dependencies,
          allTransitiveDependencies:
              GetUserModelDataFamily._allTransitiveDependencies,
          userId: userId,
        );

  GetUserModelDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<UserDataModel> Function(GetUserModelDataRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetUserModelDataProvider._internal(
        (ref) => create(ref as GetUserModelDataRef),
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
  AutoDisposeFutureProviderElement<UserDataModel> createElement() {
    return _GetUserModelDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetUserModelDataProvider && other.userId == userId;
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
mixin GetUserModelDataRef on AutoDisposeFutureProviderRef<UserDataModel> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _GetUserModelDataProviderElement
    extends AutoDisposeFutureProviderElement<UserDataModel>
    with GetUserModelDataRef {
  _GetUserModelDataProviderElement(super.provider);

  @override
  String get userId => (origin as GetUserModelDataProvider).userId;
}

String _$chatNotifierHash() => r'b9748afcdf48c55c4953511ac67d5b50ad445db3';

/// See also [ChatNotifier].
@ProviderFor(ChatNotifier)
final chatNotifierProvider =
    AutoDisposeAsyncNotifierProvider<ChatNotifier, void>.internal(
  ChatNotifier.new,
  name: r'chatNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatNotifier = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
