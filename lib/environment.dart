import 'package:flutter_config/flutter_config.dart';

class Environment {

  static String get apiKey {
    checkEnvironmentVariable("FIREBASE_API");
    return FlutterConfig.get('FIREBASE_API')!;
  }
  static String get appId {
    checkEnvironmentVariable("FIREBASE_APP_ID");
    return FlutterConfig.get('FIREBASE_APP_ID')!;
  }
  static String get messagingSenderId {
    checkEnvironmentVariable("FIREBASE_MESSAGING_SENDER_ID");
    return FlutterConfig.get('FIREBASE_MESSAGING_SENDER_ID')!;
  }
  static String get projectId {
    checkEnvironmentVariable("FIREBASE_PROJECT_ID");
    return FlutterConfig.get('FIREBASE_PROJECT_ID')!;
  }
  static String get authDomain {
    checkEnvironmentVariable("FIREBASE_AUTH_DOMAIN");
    return FlutterConfig.get('FIREBASE_AUTH_DOMAIN')!;
  }
  static String get storageBucket {
    checkEnvironmentVariable("FIREBASE_STORAGE_BUCKET");
    return FlutterConfig.get('FIREBASE_STORAGE_BUCKET')!;
  }
  static String get measurementId {
    checkEnvironmentVariable("FIREBASE_MEASUREMENT_ID");
    return FlutterConfig.get('FIREBASE_MEASUREMENT_ID')!;
  }



  static void checkEnvironmentVariable(String variableName) {
    if (FlutterConfig.get(variableName) == null) {
      throw Exception('$variableName is not defined');
    }
  }
}