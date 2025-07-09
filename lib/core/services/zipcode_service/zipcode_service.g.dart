// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zipcode_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCityStateHash() => r'67ee3942d282b28e44738d1a6ad69f1a14514260';

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

/// See also [getCityState].
@ProviderFor(getCityState)
const getCityStateProvider = GetCityStateFamily();

/// See also [getCityState].
class GetCityStateFamily extends Family<AsyncValue<CityStateModel>> {
  /// See also [getCityState].
  const GetCityStateFamily();

  /// See also [getCityState].
  GetCityStateProvider call(
    String postalCode,
  ) {
    return GetCityStateProvider(
      postalCode,
    );
  }

  @override
  GetCityStateProvider getProviderOverride(
    covariant GetCityStateProvider provider,
  ) {
    return call(
      provider.postalCode,
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
  String? get name => r'getCityStateProvider';
}

/// See also [getCityState].
class GetCityStateProvider extends AutoDisposeFutureProvider<CityStateModel> {
  /// See also [getCityState].
  GetCityStateProvider(
    String postalCode,
  ) : this._internal(
          (ref) => getCityState(
            ref as GetCityStateRef,
            postalCode,
          ),
          from: getCityStateProvider,
          name: r'getCityStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCityStateHash,
          dependencies: GetCityStateFamily._dependencies,
          allTransitiveDependencies:
              GetCityStateFamily._allTransitiveDependencies,
          postalCode: postalCode,
        );

  GetCityStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postalCode,
  }) : super.internal();

  final String postalCode;

  @override
  Override overrideWith(
    FutureOr<CityStateModel> Function(GetCityStateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCityStateProvider._internal(
        (ref) => create(ref as GetCityStateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postalCode: postalCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CityStateModel> createElement() {
    return _GetCityStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCityStateProvider && other.postalCode == postalCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postalCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCityStateRef on AutoDisposeFutureProviderRef<CityStateModel> {
  /// The parameter `postalCode` of this provider.
  String get postalCode;
}

class _GetCityStateProviderElement
    extends AutoDisposeFutureProviderElement<CityStateModel>
    with GetCityStateRef {
  _GetCityStateProviderElement(super.provider);

  @override
  String get postalCode => (origin as GetCityStateProvider).postalCode;
}

String _$zipCodeCheckerHash() => r'3ea7e9c997556397dda7fe0425e0768cd001dbbd';

/// See also [ZipCodeChecker].
@ProviderFor(ZipCodeChecker)
final zipCodeCheckerProvider =
    AutoDisposeAsyncNotifierProvider<ZipCodeChecker, bool?>.internal(
  ZipCodeChecker.new,
  name: r'zipCodeCheckerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$zipCodeCheckerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ZipCodeChecker = AutoDisposeAsyncNotifier<bool?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
