import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

enum AuthState {settings, signIn, signedIn}

class AuthModel extends ChangeNotifier {
  static final AuthModel instance = AuthModel._();

  AuthModel._();

  static String get userId => FirebaseAuth.instance.currentUser?.uid ?? '';
  static String get userName => FirebaseAuth.instance.currentUser?.displayName ?? '';

  AuthState _state = AuthState.settings;
  AuthState get state => _state;

  String _serviceConfig = '';
  String get serviceConfig => _serviceConfig;

  Future<void> initialize(String serviceConfig) async {
    _serviceConfig = serviceConfig;

    String formatedServiceConfig = _serviceConfig.replaceAllMapped(
      RegExp(r'(?<=[{\s,])([a-zA-Z0-9_]+)(?=\s*:)'),
      (match) => '"${match.group(1)}"'
    );

    dynamic decodedJson = jsonDecode(formatedServiceConfig);

    FirebaseOptions options = FirebaseOptions(
      appId: decodedJson['appId'] ?? '',
      apiKey: decodedJson['apiKey'] ?? '',
      projectId: decodedJson['projectId'] ?? '',
      authDomain: decodedJson['authDomain'] ?? '',
      storageBucket: decodedJson['storageBucket'] ?? '',
      messagingSenderId: decodedJson['messagingSenderId'] ?? ''
    );

    await Firebase.initializeApp(options: options);
    _setState(AuthState.signIn);
  }

  Future<void> signInWithGoogle() async {
    try {
      GoogleAuthProvider provider = GoogleAuthProvider();
      provider.setCustomParameters({
        'prompt': 'select_account'
      });
      await FirebaseAuth.instance.signInWithPopup(provider);
      _setState(AuthState.signedIn);
    }
    catch (e) {
      await signOut();
      rethrow;
    }
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _setState(AuthState.signIn);
  }

  void showSettings() {
    _setState(AuthState.settings);
  }

  void _setState(AuthState state) {
    _state = state;
    notifyListeners();
  }

  static Future<void> refreshToken() async {
    await FirebaseAuth.instance.currentUser?.getIdToken(true);
  }

  static void registerListener(Function(String token, DateTime? expirationDateTime) callback) {
    FirebaseAuth.instance.idTokenChanges().listen(
      (User? user) async {
        IdTokenResult? token = await user?.getIdTokenResult();
        callback(token?.token ?? '', token?.expirationTime);
      }
    );
  }
}