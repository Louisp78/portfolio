import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'FIREBASE_API', obfuscate: true)
  static final String firebaseApi = _Env.firebaseApi;

  @EnviedField(varName: 'FIREBASE_AUTH_DOMAIN', obfuscate: true)
  static final String firebaseAuthDomain = _Env.firebaseAuthDomain;

  @EnviedField(varName: 'FIREBASE_PROJECT_ID', obfuscate: true)
  static final String firebaseProjectId = _Env.firebaseProjectId;

  @EnviedField(varName: 'FIREBASE_STORAGE_BUCKET', obfuscate: true)
  static final String firebaseStorageBucket = _Env.firebaseStorageBucket;

  @EnviedField(varName: 'FIREBASE_MESSAGING_SENDER_ID', obfuscate: true)
  static final String firebaseMessagingSenderId = _Env.firebaseMessagingSenderId;

  @EnviedField(varName: 'FIREBASE_APP_ID', obfuscate: true)
  static final String firebaseAppId = _Env.firebaseAppId;

  @EnviedField(varName: 'FIREBASE_MEASUREMENT_ID', obfuscate: true)
  static final String firebaseMeasurementId = _Env.firebaseMeasurementId;
}