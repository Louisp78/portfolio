import 'dart:html';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

  static String get apiKey {
    checkEnvironmentVariable("FIREBASE_API");
    return dotenv.env['FIREBASE_API']!;
  }
  static String get appId {
    checkEnvironmentVariable("FIREBASE_APP_ID");
    return dotenv.env['FIREBASE_APP_ID']!;
  }
  static String get messagingSenderId {
    checkEnvironmentVariable("FIREBASE_MESSAGING_SENDER_ID");
    return dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!;
  }
  static String get projectId {
    checkEnvironmentVariable("FIREBASE_PROJECT_ID");
    return dotenv.env['FIREBASE_PROJECT_ID']!;
  }
  static String get authDomain {
    checkEnvironmentVariable("FIREBASE_AUTH_DOMAIN");
    return dotenv.env['FIREBASE_AUTH_DOMAIN']!;
  }
  static String get storageBucket {
    checkEnvironmentVariable("FIREBASE_STORAGE_BUCKET");
    return dotenv.env['FIREBASE_STORAGE_BUCKET']!;
  }
  static String get measurementId {
    checkEnvironmentVariable("FIREBASE_MEASUREMENT_ID");
    return dotenv.env['FIREBASE_MEASUREMENT_ID']!;
  }



  static void checkEnvironmentVariable(String variableName) {
    if (dotenv.env[variableName] == null) {
      throw Exception('$variableName is not defined');
    }
  }
}