class Strings {
  static const String appTitle = 'Firebase Authentication';
  static const String screenSettingsTitle = 'Settings';
  static const String screenSignInTitle = 'Sign In';
  static const String ok = 'Ok';
  static const String copy = 'Copy';
  static const String error = 'Error';
  static const String issuer = 'Issuer';
  static const String userId = 'User ID';
  static const String refresh = 'Refresh';
  static const String signOut = 'Sign Out';
  static const String audience = 'Audience';
  static const String settings = 'Settings';
  static const String initialize = 'Initialize';
  static const String signInWithGoogle = 'Sign In with Google';
  static const String madeWithFlutter = 'Made with Flutter  🩵';

  static const String enterFirebaseServiceConfig =
    'Enter Firebase Service Configuration:\n\n'
    '{\n'
    '    apiKey: "Abc123...",\n'
    '    ...\n'
    '}\n\n'
    '*It is NOT in JSON format.';

  static String screenSignedInTitle(String userName) => 'Welcome, ${userName}!';
  static String token(DateTime? expiresIn) => 'Token (Expires In ${expiresIn})';
}