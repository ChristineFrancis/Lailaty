import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lailaty/common%20features/authentication/data/models/user_model.dart';
import 'package:lailaty/core/error_manager/failures.dart';

class SecureStorageService {
  final FlutterSecureStorage secureStorage;

  SecureStorageService({required this.secureStorage});


  //! -----------------AUTH STORAGE---------------------

  static const String _userKey = 'user';
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _isLoggedInKey = 'isLoggedIn';

  Future<Either<Failure, Unit>> cacheAuthData(
      UserModel user, String accessToken, String refreshToken) async {
    try {
      final userJson = json.encode(user.toJson());
      await secureStorage.write(key: _userKey, value: userJson);
      await secureStorage.write(key: _accessTokenKey, value: accessToken);
      await secureStorage.write(key: _refreshTokenKey, value: refreshToken);
      await secureStorage.write(key: _isLoggedInKey, value: 'true');

      return Right(unit);
    } catch (e) {
      return left(StorageFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>?>> getCachedAuthData() async {
    try {
      final userString = await secureStorage.read(key: _userKey);
      final accessToken = await secureStorage.read(key: _accessTokenKey);
      final refreshToken = await secureStorage.read(key: _refreshTokenKey);
      final isLoggedInValue = await secureStorage.read(key: _isLoggedInKey);

      if (userString != null &&
          accessToken != null &&
          refreshToken != null &&
          isLoggedInValue != null)  {
        return Right({
          'user': UserModel.fromJson(json.decode(userString)),
          'access_token': accessToken,
          'refresh_token': refreshToken,
          'isLoggedIn': isLoggedInValue == 'true',
        });
      }
      return Right(null);
    } catch (e) {
      return Left(StorageFailure(e.toString()));
    }
  }

  Future<Either<Failure, Unit>> clearAuthData() async {
    try {
      await secureStorage.delete(key: _userKey);
      await secureStorage.delete(key: _accessTokenKey);
      await secureStorage.delete(key: _refreshTokenKey);
      await secureStorage.write(key: _isLoggedInKey, value: 'false');

      print('MMMSSSHHHYYY ALHAL');

      return Right(unit);
    } catch (e) {
      return Left(StorageFailure(e.toString()));
    }
  }

  //!-----------------FIRST TIME CHECK------------------
  static const String _isFirstTimeKey = 'is_first_time';

  Future<Either<Failure, bool>> getIsFirstTime() async {
    try {
      final value = await secureStorage.read(key: _isFirstTimeKey);
      // if it not exist , it is the first time
      return Right(value == null ? true : value == 'true');
    } catch (e) {
      return Left(StorageFailure(e.toString()));
    }
  }


  Future<Either<Failure, Unit>> setIsFirstTime(bool value) async {
    try {
      await secureStorage.write(key: _isFirstTimeKey, value: value ? 'true' : 'false');
      return Right(unit);
    } catch (e) {
      return Left(StorageFailure(e.toString()));
    }
  }

}
