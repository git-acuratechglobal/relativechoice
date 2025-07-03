import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:relative_choice/core/network/api_client.dart';
import 'package:relative_choice/core/services/auth_service/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../features/auth_feature/providers/authprovider.dart';
part 'zipcode_service.g.dart';

final zipCodeServiceProvider = Provider<ZipCodeService>((ref) {
  final client = ref.watch(apiClientProvider);
  return ZipCodeService(client);
});

class ZipCodeService {
  final ApiClient _client;
  ZipCodeService(this._client);

  // Future<bool> isRealZipCode(String zip) async {
  //   return asyncGuard(() async {
  //     final url = 'https://api.zippopotam.us/us/$zip';
  //     final response = await _client.get(url);
  //     return response.statusCode == 200;
  //   });
  // }

  Future<bool> isValidUSZipWithGoogle(String zip) async {
    if (zip.isEmpty || zip.contains(' ')) {
      return false;
    }
    return asyncGuard(() async {
      const apiKey = 'AIzaSyCG4YZMnrZwDGA2sXcUF4XLQdddSL4tz5Y';
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?components=postal_code:$zip|country:US&key=$apiKey';
      final response = await _client.get(url);
      final List<dynamic> result = response.data['results'];
      if (result.isNotEmpty) {
        return true;
      }
      return false;
    });
  }

  Future<LatLngData> getLatLngFromZipcode({required String zipcode}) async {
    return asyncGuard(() async {
      final apiKey = "AIzaSyCG4YZMnrZwDGA2sXcUF4XLQdddSL4tz5Y";
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?address=$zipcode&key=$apiKey';
      final response = await _client.get(url);
      final location = response.data['results'][0]['geometry']['location'];
      return LatLngData(lat: location['lat'], lng: location['lng']);
    });
  }

  Future<CityStateModel> getCityAndStateFromPostalCode(
      String postalCode) async {
    return asyncGuard(() async {
      final apiKey = "AIzaSyCG4YZMnrZwDGA2sXcUF4XLQdddSL4tz5Y";
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?address=$postalCode&key=$apiKey';

      final response = await _client.get(url);

      final results = response.data['results'] as List;

      if (results.isNotEmpty) {
        final components = results[0]['address_components'] as List;

        String? city;
        String? state;

        for (var comp in components) {
          final types = comp['types'] as List;
          if (types.contains('locality')) {
            city = comp['long_name'];
          } else if (types.contains('administrative_area_level_1')) {
            state = comp['short_name'];
          }
        }

        return CityStateModel(address: '$city, $state');
      }
      return CityStateModel(address: 'Not Found');
    });
  }
}

@riverpod
class ZipCodeChecker extends _$ZipCodeChecker {
  Timer? _debounceTimer;

  @override
  FutureOr<bool?> build() async {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });
    return null;
  }

  Future<void> checkZipCode({required String zipCode}) async {
    _debounceTimer?.cancel();
    state = const AsyncLoading();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      state = await AsyncValue.guard(() async {
        return ref
            .watch(zipCodeServiceProvider)
            .isValidUSZipWithGoogle(zipCode);
      });
    });
  }
}

@riverpod
Future<CityStateModel> getCityState(Ref ref, String postalCode) async {
  return await ref
      .watch(zipCodeServiceProvider)
      .getCityAndStateFromPostalCode(postalCode);
}

class CityStateModel {
  final String address;

  CityStateModel({required this.address});
}
