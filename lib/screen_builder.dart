import 'package:flutter/material.dart';

import 'auth_model.dart';
import 'screen_settings.dart';
import 'screen_sign_in.dart';
import 'screen_signed_in.dart';

class ScreenBuilderWidget extends ListenableBuilder {
  ScreenBuilderWidget()
    : super(
        listenable: AuthModel.instance,

        builder: (builderContext, builderChild) {
          switch (AuthModel.instance.state) {
            case AuthState.settings: return ScreenSettings();
            case AuthState.signIn: return ScreenSignIn();
            case AuthState.signedIn: return ScreenSignedIn();
          }
        }
      );
}