import 'package:flutter/material.dart';

import 'auth_model.dart';
import 'button.dart';
import 'scaffold.dart';
import 'strings.dart';
import 'theme.dart';

class ScreenSignIn extends CustomScaffold {
  ScreenSignIn()
    : super(icon: CustomTheme.signInIcon, title: Strings.screenSignInTitle);

  @override
  Widget buildCustomScaffoldChild(BuildContext context) {
    return Column(
      spacing: CustomTheme.xLargeSpacing,
      children: [
        Expanded(
          child: Center(
            child: ProcessingButton(
              icon: CustomTheme.signInIcon,
              text: Strings.signInWithGoogle,
              onPressed: AuthModel.instance.signInWithGoogle
            )
          )
        ),
        CustomButton(
          icon: CustomTheme.settingsOutlinedIcon,
          text: Strings.settings,
          onPressed: AuthModel.instance.showSettings
        )
      ]
    );
  }
}