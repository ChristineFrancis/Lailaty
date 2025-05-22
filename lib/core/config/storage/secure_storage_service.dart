import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lailaty/core/error_manager/failures.dart';
import 'package:lailaty/feature/authentication/data/models/user_model.dart';

class SecureStorageService {
  final FlutterSecureStorage secureStorage;

  SecureStorageService({required this.secureStorage});

  static const String _emailKey = 'email';
  static const String _userRoleKey = 'user_role';
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
      await secureStorage.write(key: _userRoleKey, value: user.role);

      print('[SecureStorageService] CACHED user role: ${user.role}');
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
          isLoggedInValue != null) {
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
      await secureStorage.write(
          key: _isFirstTimeKey, value: value ? 'true' : 'false');
      return Right(unit);
    } catch (e) {
      return Left(StorageFailure(e.toString()));
    }
  }

  //! Method to save an email
  Future<void> saveEmail(String email) async {
    await secureStorage.write(key: _emailKey, value: email);
  }

  //! Method to retrieve the stored email.
  Future<String?> getEmail() async {
    return await secureStorage.read(key: _emailKey);
  }

//! for decider page :
  Future<Either<Failure, Unit>> setLocalBool(String key, bool value) async {
    try {
      await secureStorage.write(key: key, value: value ? 'true' : 'false');
      return Right(unit);
    } catch (e) {
      return Left(StorageFailure(e.toString()));
    }
  }

//?  token :
  Future<String?> getAccessToken() async {
    return await secureStorage.read(key: _accessTokenKey);
  }

  Future<String?> getRefreshToken() async {
    return await secureStorage.read(key: _refreshTokenKey);
  }

  Future<void> saveTokensData(Map<String, dynamic> data) async {
    await secureStorage.write(
        key: _accessTokenKey, value: data['access_token']);
    await secureStorage.write(
        key: _refreshTokenKey, value: data['refresh_token']);
  }
}
