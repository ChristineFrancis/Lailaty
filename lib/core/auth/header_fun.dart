import 'package:lailaty/core/config/storage/service_locator.dart';
import 'package:lailaty/core/config/storage/secure_storage_service.dart';

Future<Map<String, String>> getHeader(bool hasToken) async {
  if (hasToken == false) {
    return {
      'Accept': 'application/json',
    };
  } else {
    final secureStorageService = sl<SecureStorageService>();
    final cachedDataEither = await secureStorageService.getCachedAuthData();
    print('Cached Auth Data: $cachedDataEither');
    return cachedDataEither.fold(
      (failure) => {
        'Accept': 'application/json',
      },
      (data) {
        final token = data?['access_token'];
        if (token != null) {
          return {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          };
        } else {
          return {
            'Accept': 'application/json',
          };
        }
      },
    );
  }
}
